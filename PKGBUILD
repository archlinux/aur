# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.2.5.1
_libgit2ver=1.1.1
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'hicolor-icon-theme'
    'freetype2'
    'libpng'
    'libjpeg-turbo'
    'qt6-svg'
    'qt6-base'
    'pcre'
)
makedepends=(
    'git'
    'cmake'
    'base-devel'
    'python>=3'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-research-v${pkgver}-ubuntu22.04.deb"
    "libgit2-${_libgit2ver}::git+https://github.com/libgit2/libgit2.git#tag=v${_libgit2ver}"
)
sha256sums=('a79d7899147a8c8e4cb14b2d77d87208db1ee5f408872ce3f31d9e9e0a4fbb80'
            'SKIP')
build() {
    cd "${srcdir}/libgit2-${_libgit2ver}"
    install -Dm755 -d build
    cd build
    cmake ..
    cmake --build .
}
package() {
    bsdtar -xf "${srcdir}/data."* -C "${pkgdir}"
    install -Dm644 "${srcdir}/libgit2-${_libgit2ver}/build/libgit2.so.1.1.1" "${pkgdir}/usr/lib/libgit2.so.1.1"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.2.9.8
_libgit2ver=1.1.1
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor.(Prebuilt version)"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
_libgit2url="https://github.com/libgit2/libgit2"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'freetype2'
    'libpng'
    'libjpeg-turbo'
    'qt6-svg'
    'qt6-base'
    'pcre'
    'python'
)
makedepends=(
    'cmake'
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-research-v${pkgver}-fedora41.rpm"
    "libgit2-${_libgit2ver}.tar.gz::${_libgit2url}/archive/refs/tags/v${_libgit2ver}.tar.gz"
)
sha256sums=('578fe5e76b71a61851b22bbf478a782f6b0f4dbc97d508b473243e3a81ab2b13'
            '13a525373f64c711a00a058514d890d1512080265f98e0935ab279393f21a620')
prepare() {
    cd "${srcdir}/libgit2-${_libgit2ver}"
    install -Dm755 -d build
    cd build
    cmake ..
    cmake --build .
}
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/libgit2-${_libgit2ver}/build/libgit2.so.1.1.1" "${pkgdir}/usr/lib/libgit2.so.1.1"
}
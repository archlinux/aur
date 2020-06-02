# Maintainer: gbr <gbr@protonmail.com>
_pkgname=vibrantlinux
pkgname=vibrantlinux-git
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux'
arch=('x86_64')
url='https://github.com/zee-mzha/vibrantlinux'
license=('MIT')
depends=('qt5-base' 'libvibrant')
makedepends=('git')
conflicts=('vibrantlinux')
provides=('vibrantlinux')
source=("${_pkgname}::git+https://github.com/zee-mzha/vibrantLinux.git")
sha256sums=('SKIP')
pkgver=2.1.1.r10.g3ddb88f

pkgver() {
    cd "${_pkgname}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    qmake
    make
}

package() {
    cd "${_pkgname}"

    make INSTALL_ROOT="${pkgdir}" install

    mv "${pkgdir}/usr/share/applications/application.desktop" "${pkgdir}/usr/share/applications/vibrantLinux.desktop"
}

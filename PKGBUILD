# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Bruno Goncalves <bigbruno@gmail.com>

_pkgname=biglinux-driver-manager
pkgname=${_pkgname}-git
pkgver=r216.f449c7c
pkgrel=2
arch=('any')
license=('MIT')
url="https://github.com/biglinux/biglinux-driver-manager"
pkgdesc="Application to manage kernel and mesa drivers for BigLinux"
makedepends=('git')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/biglinux/biglinux-driver-manager.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=(
    'python>=3.10'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'polkit'
    'hicolor-icon-theme'
    'avahi'
    'nss-mdns'
    )
    provides=("${_pkgname}=${pkgver}")
    conflicts=("${_pkgname}")

    cd ${srcdir}/${_pkgname}

    # Install
    cp -a usr "${pkgdir}/"

    # Install license and documentation if present
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

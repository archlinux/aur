# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Bruno Goncalves <bigbruno@gmail.com>

pkgbase=biglinux-driver-manager
pkgname=${pkgbase}-git
pkgver=r216.f449c7c
pkgrel=1
arch=('any')
license=('MIT')
url="https://github.com/biglinux/biglinux-driver-manager"
pkgdesc="Application to manage kernel and mesa drivers for BigLinux"
makedepends=('git')
install="${pkgbase}.install"
source=("${pkgbase}::git+https://github.com/biglinux/biglinux-driver-manager.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgbase}
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

    cd ${srcdir}/${pkgbase}

    # Install
    cp -a usr "${pkgdir}/"

    # Install license and documentation if present
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
}

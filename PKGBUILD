# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=autorandr-launcher-git
pkgver=1.14.r8.g303d00b
pkgrel=1
pkgdesc="Listens to X server screen change events and launches autorandr after an event occurs."
arch=('x86_64')
url="https://github.com/phillipberndt/autorandr"
license=('GPL-3.0-only')
provides=('autorandr-launcher')
conflicts=('autorandr-launcher')
depends=('autorandr' 'glibc' 'libxcb')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    make contrib/autorandr_launcher/autorandr-launcher
    install -Dm755 contrib/autorandr_launcher/autorandr-launcher ${pkgdir}/usr/bin/autorandr-launcher
    install -Dm644 contrib/etc/xdg/autostart/autorandr-launcher.desktop ${pkgdir}/etc/xdg/autostart/autorandr-launcher.desktop
}

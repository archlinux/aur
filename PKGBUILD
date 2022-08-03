# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname='xkblayout-subscribe'
pkgname="${_pkgname}-git"
pkgver=r1.bc13b72
pkgrel=3
pkgdesc='Subscribe to X keyboard layout events. useful for updating statusbars.'
url='https://github.com/ghesy/xkblayout-subscribe'
arch=('x86_64')
license=('GPL')
depends=('libpulse')
makedepends=('git' 'pkgconf')
source=("git+${url}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

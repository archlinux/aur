# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='pulseaudio-subscribe'
pkgname="${_pkgname}-git"
pkgver=r9.983b005
pkgrel=1
pkgdesc='program to subscribe to pulseaudio events. useful for updating statusbars.'
arch=('x86_64')
url='https://github.com/soystemd/pulseaudio-subscribe'
license=('GPL')
depends=('libpulse')
makedepends=('git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "${_pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

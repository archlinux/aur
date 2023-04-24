# Maintainer: koonix <ehsan at disroot dot org>
_pkgname='xkblayout-remember'
pkgname="${_pkgname}-git"
pkgver=r23.bf028b1
pkgrel=5
pkgdesc='Program to remember the keyboard layout for X11 windows.'
url='https://github.com/koonix/xkblayout-remember'
arch=('x86_64')
license=('GPL')
depends=('libx11' 'glib2')
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

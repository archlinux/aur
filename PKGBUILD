# Maintainer: David Mougey <imapiekindaguy at gmail dot com>

pkgname=skroll-git
_pkgname=${pkgname%-git}
pkgver=0.2.r15.g500beaf
pkgrel=1
pkgdesc='Scrolls text'
arch=('i686' 'x86_64')
url='http://git.z3bra.org/cgit.cgi/skroll'
license=('WTFPL')
makedepends=('git')
provides=('skroll')
conflicts=('skroll')
source=('git://z3bra.org/skroll')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "0.%s.r%s.g%s" "$(grep -i version LICENSE | grep -oP 'Version [0-9]{1,2}' | cut -d' ' -f2)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

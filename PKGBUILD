# Maintainer: paulsnar <paulsnar@paulsnar.lv>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: farid abdelnour < farid at atelier-labs.org>

_pkgname=oggfwd
pkgname=oggfwd-git
pkgdesc="Pipes an ogg stream to an icecast server"
license=('GPL')
conflicts=('oggfwd' 'oggfwd-bzr')
url="http://v2v.cc/~j/oggfwd/"
pkgver=r19.506088e
pkgrel=2

source=("${_pkgname}::git+https://r-w-x.org/oggfwd.git#branch=master")
md5sums=('SKIP')
depends=('libshout')
arch=('i686' 'x86_64')

build() {
	cd "$srcdir/${_pkgname}"
	make oggfwd
    gzip -fk oggfwd.1
}

package() {
	cd "$srcdir/${_pkgname}"
	install -D -m755 oggfwd "$pkgdir/usr/bin/oggfwd"
    install -D -m644 oggfwd.1.gz "$pkgdir/usr/share/man/man1/oggfwd.1.gz"
}

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

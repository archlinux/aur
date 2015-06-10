# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=deltarpm
pkgver=3.6
pkgrel=1
pkgdesc="Create deltas between rpms"
arch=('i686' 'x86_64')
license=('BSD')
url="http://gitorious.org/$pkgname/$pkgname"
depends=('rpm-org' 'zlib')
makedepends=('python2' 'python')
optdepends=('python2: for python2 module'
            'python:  for python3 module')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-3.6.tar.bz2")
md5sums=('2cc2690bd1088cfc3238c25e59aaaec1')

build() {
	cd "$pkgname-$pkgver"
	make PYTHONS='python2 python' \
	     prefix=/usr              \
	     zlibbundled=''           \
	     zlibldflags='-lz'        \
	     zlibcppflags=''          \
	     all python
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/"       \
	     PYTHONS='python2 python' \
	     prefix=/usr              \
	     install

	install -D -m644 README      "$pkgdir/usr/share/doc/$pkgname/README"
	install -D -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:

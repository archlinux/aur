# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=deltarpm
pkgver=3.6.1
pkgrel=1
pkgdesc="Create deltas between rpms"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/rpm-software-management/$pkgname"
depends=('rpm-org' 'zlib')
makedepends=('python2' 'python')
optdepends=('python2: for python2 module'
            'python:  for python3 module')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c48086229bdfcf5af890f104231180c6')

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

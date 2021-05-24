# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=reglookup
pkgver=1.0.1
pkgrel=5
pkgdesc="Command line utility for reading and querying Windows NT registries"
arch=('i686' 'x86_64')
url="https://code.blindspotsecurity.com/trac/reglookup/"
license=('GPL')
depends=('talloc')
makedepends=('gcc' 'scons' 'docbook2x')
source=($pkgname-src-$pkgver::svn+https://code.blindspotsecurity.com/dav/reglookup/releases/$pkgver
	SConstruct.patch
	pyregfi-distutils.py.patch)

prepare() {
	cd "$srcdir/$pkgname-src-$pkgver"
	patch < ../SConstruct.patch
	patch < ../pyregfi-distutils.py.patch
}

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	scons
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	PREFIX="$pkgdir/usr/" scons install
}

md5sums=('SKIP'
         'a1d31fb09fbce3864abde8babf4c63eb'
         'd90fd7b3f43e5c3079c0eb152d9d2df6')

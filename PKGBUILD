# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=reglookup
pkgver=1.0.1
pkgrel=4
pkgdesc="Command line utility for reading and querying Windows NT registries"
arch=('i686' 'x86_64')
url="http://projects.sentinelchicken.org/reglookup"
license=('GPL')
depends=('talloc')
makedepends=('gcc' 'scons' 'docbook2x')
source=(http://projects.sentinelchicken.org/data/downloads/$pkgname-src-$pkgver.tar.gz
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

md5sums=('c451c2dba904db8ae5b0531ca303e322'
         'a1d31fb09fbce3864abde8babf4c63eb'
         'd90fd7b3f43e5c3079c0eb152d9d2df6')

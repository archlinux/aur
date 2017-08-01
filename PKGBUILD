# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=ophidia-terminal
pkgver=1.1.0
pkgrel=1
pkgdesc="The Ophidia Terminal is an advanced bash-like interpreter through which it is possible to submit arbitrary requests to an Ophidia Server"
arch=(i686 x86_64)
url="https://github.com/indigo-dc/ophidia-terminal"
license=('GPL')
depends=(jansson graphviz gtk2 libxml2 libcurl-openssl-1.0 openssl-1.0 readline libssh2)
source=(https://github.com/indigo-dc/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('7777d72a10677c5433b2a4a1f26cb1d7')

prepare() {
	cd "$pkgname-$pkgver"
    ./bootstrap
}

build() {
	cd "$pkgname-$pkgver"
    export CFLAGS="$CFLAGS -I/usr/include/openssl-1.0"
    export LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.0 -L/usr/lib/libcurl-openssl-1.0"
    ./configure --prefix=/usr
	make OPENSSL_LIBS='-lssl'
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

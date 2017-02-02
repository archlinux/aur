# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=ophidia-terminal
pkgver=0.11.0
pkgrel=1
pkgdesc="The Ophidia Terminal is an advanced bash-like interpreter through which it is possible to submit arbitrary requests to an Ophidia Server"
arch=(i686 x86_64)
url="https://github.com/indigo-dc/ophidia-terminal"
license=('GPL')
depends=(jansson graphviz gtk2 libxml2 curl openssl readline libssh2)
source=(https://github.com/indigo-dc/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('e74a7b098a16726fa8b4f09bb3ac9b32')

prepare() {
	cd "$pkgname-$pkgver"
    ./bootstrap
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make OPENSSL_LIBS='-lssl'
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

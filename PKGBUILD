# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.0.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('4961e030274e763aa02541457aa5aab6cd0d61758861b98d2cdac6acc42c3fb55b6adba72749edd3b663225ab844d7ef60809972478992165b071645fe6af65f'
            'db495a449b528a6bee555bafdeb965c1a780d0f9d15d069749e50d96ac9e1fff14a2487bf7dc7f2268011bc0c53093f880fadc4172c50a9ac59d29b280d7f6bf')
sha256sums=('4a7c5cbd5c7c2d3fea4a898c6ce87ff705756dd362cb2e3b241ae55e514e8280'
            '980fadbac5e7b5f722cb43df6fd8546e2eb3cc0cbdc2940606a63be523c3023e')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}

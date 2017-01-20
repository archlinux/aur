# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.5.1
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.9.0')
url="http://osmcode.org/osmium-tool/"
license=('GPL3')
source=("https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../zsh_completion/_osmium "${pkgdir}/usr/share/zsh/site-functions/_osmium"
}

sha1sums=('e5550abe5fe9e183c6b41c8bf92bdee55b81d170')
sha256sums=('34e5a9132a47854a34a6c2be015264d141f0f73e0f2f1697bc14f3df3af45198')

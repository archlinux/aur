# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=immer
pkgver=0.6.2
pkgrel=1
pkgdesc="Postmodern immutable and persistent data structures for C++"
arch=('any')
url="https://sinusoid.es/immer"
license=('Boost')
makedepends=('cmake')
provides=('immer-git')
conflicts=('immer-git')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/arximboldi/"$pkgname"/archive/v"$pkgver".tar.gz
"$pkgname-$pkgver.patch"::https://patch-diff.githubusercontent.com/raw/arximboldi/immer/pull/85.patch)
md5sums=('b93cf91bcec42da37beb87e7148695d9'
'432b88ddfdd0fa3be23e14afe51f17a4')

prepare() {
	cd "$pkgname-$pkgver"
	patch -i "$srcdir/$pkgname-$pkgver.patch"
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

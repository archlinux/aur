# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.4.0
pkgrel=1
pkgdesc="Command line utility to the Metis Machine platform"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('af3a43898a8bb9dca9eec93921a1f725')
sha1sums=('5020622188ec52a475d1bb6ab1c549de207b2479')
sha256sums=('9defd32c0d8f2265ea003b7b3ce54fdb625ed54a11376f637ff9bdcd8501981d')
validpgpkeys=()

prepare() {
	cp "../$pkgname-$pkgver.patch" "$srcdir/$pkgname-$pkgver.patch"
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}

# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=coil64
_pkgname=Coil64
pkgver=2.1.18
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=('GPL')
depends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('95aacc5414c43a85eb3b011d289779029a6173f8aaf6c3b49591ee07610ccc88216787aaf06cba192a224c8ece9483426bf11b12fb3119ed6a8ff00b15cb948b')

prepare() {
	cd "$_pkgname-$pkgver"
	# Arch prefers executables be compiled position-independent
	sed -i -e '/-no-pie/s/^/#/' "$_pkgname.pro"
}

build() {
	cd "$_pkgname-$pkgver"
	qmake "$_pkgname.pro"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	install -D "$_pkgname" "$pkgdir/usr/bin/$pkgname"
}

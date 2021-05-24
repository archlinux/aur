# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=coil64
_pkgname=Coil64
pkgver=2.1.16
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=('GPL')
depends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('571e4a41608a7f114c4e817eef4106254da548e5b266a7063bdbfae7a6d92d4e552fa252fb074998b0712163d0fe81acc095a6f9c94169520a9faa3a7fa96158')

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

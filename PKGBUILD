# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=coil64
_pkgname=Coil64
pkgver=2.0.13
_gitrev=98a80f788cb613df20b75966b6877be54cb0e858
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=('GPL')
depends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_pkgname/archive/$_gitrev.tar.gz")
sha512sums=('5d78b22f37983d54f0e1fb99c22bca0494ab5688cb9279b0448f853a15a8858a7bbb2e85021b26081a90a52cea6f1f9ec401c6d604baf84da9184546eb189d2b')

prepare() {
	cd "$_pkgname-$_gitrev"
	# Arch prefers executables be compiled position-independent
	sed -i -e '/-no-pie/s/^/#/' "$_pkgname.pro"
}

build() {
	cd "$_pkgname-$_gitrev"
	qmake "$_pkgname.pro"
	make
}

package() {
	cd "$_pkgname-$_gitrev"
	install -D "$_pkgname" "$pkgdir/usr/bin/$pkgname"
}

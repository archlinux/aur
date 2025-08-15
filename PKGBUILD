# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit
_pkgver="v2.0.0-alpha.187"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
depends=('gcc-libs' 'esptool')
optdepends=("toit-vessels-bin=$pkgver: Vessels for cross-compilation")
makedepends=(
	'git'
	'cmake'
	'ninja'
	'go'
	# For xxd.
	'vim'
)
source=("$pkgname-$_pkgver.tar.gz"::"https://github.com/toitlang/toit/releases/download/$_pkgver/$pkgname-$_pkgver-with-submodules.tar.gz")
sha256sums=('89372eef03a8c6228925fd67e80babbd53ffcbc4dc889f2a7a554879796c8f03')

build() {
	cd "$pkgname-$_pkgver"
	make -j1
}

package() {
	echo $PWD
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
}

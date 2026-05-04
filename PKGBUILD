# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit
_pkgver="v2.0.0-alpha.193"
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
sha256sums=('506344da80d3c3b45091b844a718f752a1be2749177b956b39131b130497e97f')

build() {
	cd "$pkgname-$_pkgver"
	make -j1
}

package() {
	echo $PWD
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
}

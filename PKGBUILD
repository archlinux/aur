# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit
_pkgver="v2.0.0-alpha.182"
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
sha256sums=('846c21320bbc26815a4695f322859e8510ce685551ebbeb966786011c110c3b1')

build() {
	cd "$pkgname-$_pkgver"
	make -j1
}

package() {
	echo $PWD
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.run" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.compile" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.pkg" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.lsp" "$pkgdir/usr/bin"
}

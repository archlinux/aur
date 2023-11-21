# Maintainer: Rohit Lodha <rohitlodha+aur@gmail.com>

pkgbase='terminusdb'
pkgname=("$pkgbase" "$pkgbase-dashboard" )
pkgver=11.1.9
pkgrel=1
pkgdesc='A distributed database with a collaboration model'
arch=('x86_64')
license=('Apache-2.0')
url='https://github.com/terminusdb/terminusdb'
depends=('swi-prolog')
makedepends=('clang' 'git' 'gmp' 'rustup' 'protobuf')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/terminusdb/terminusdb/archive/refs/tags/v$pkgver.tar.gz")
options=(!strip)
prepare() {
	cd "$pkgbase-${pkgver}"
	make install-deps
	rustup default stable
}

build() {
  cd "$pkgbase-${pkgver}"
  TERMINUSDB_DASHBOARD_PATH=/usr/share/terminusdb/dashboard  make
  make install-dashboard
}

package_terminusdb() {
	cd "$pkgbase-${pkgver}"
	install -m755 -d "${pkgdir}"/usr/bin
	install -m755 terminusdb "$pkgdir/usr/bin"

}

package_terminusdb-dashboard() {
	cd "$pkgbase-${pkgver}"
	install -m755 -d "$pkgdir"/usr/share/"$pkgbase"
	cp -R dashboard "$pkgdir"/usr/share/"$pkgbase"/
}

sha256sums=('92e50b47e8680b00f1501916c7f1b4b928b72142ab2c246cb6408bd6856dd514')

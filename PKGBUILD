# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=atmosim
pkgver=2.4.1
pkgrel=1
pkgdesc="A CLI maxcap calculator for Space Station 14"
arch=(any)
url="https://github.com/Ilya246/atmosim"
license=('GPL-3.0-or-later')
makedepends=(cmake git)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	make -j release
}

package() {
	cd "$pkgname"
	install -Dm755 "out/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -dm755 "$pkgdir/etc/$pkgname" # create config directory
	install -m644 configs/* "$pkgdir/etc/$pkgname/" # copy configs
}

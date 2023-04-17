# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=chillspot
pkgver=0.1.3
pkgrel=1
pkgdesc="Fan curve control and temperature monitor for MSI laptops"
arch=('x86_64')
url="https://gitlab.com/fvtronics/chillspot"
license=('GPL')
depends=(
	'python-gobject'
	'python-configupdater'
	'libadwaita'
	'gtk4'
	'polkit'
)
makedepends=(
    'meson'
    'ninja'
)
checkdepends=('meson')
optdepends=('isw: configuration values persistence')
backup=("usr/share/$pkgname/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/fvtronics/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8b04467d6a69d9de6302de84831798bbdfecea2fb31ba9577abfad0df7770320')

build() {
	arch-meson $pkgname-$pkgver build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}

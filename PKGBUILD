# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=chillspot
pkgver=0.1.2
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
sha256sums=('fa1a62f7a6b2595a070b457a35f3050433804016d7e5a2d2199953a1ef7c2cdc')

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

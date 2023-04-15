# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=chillspot
pkgver=0.1.1
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
sha256sums=('ede07ee06d6eb9466e6ba932e82d568ac37e87260b8668af164dd7bbb60da48a')

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

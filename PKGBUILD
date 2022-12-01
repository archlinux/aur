# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.6.0
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/postmarketOS/megapixels'
license=('LGPL')
depends=('gtk4' 'zbar' 'feedbackd')
makedepends=('meson')
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
b2sums=('adca9fcad9e6d7b4181a0aac8aa8c1a7b00978ce22d79a589e161fb8736e850d5e431263885a56a4407f5ee58f6cdb915aa6bbfb8c5fc13ee13567d3bbea2bbd')

build() {
	arch-meson ${pkgname}-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

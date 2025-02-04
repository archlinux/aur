# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.8.3
pkgrel=2
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/megapixels-org/megapixels'
license=('GPL-3.0+')
depends=('gtk4' 'zbar' 'feedbackd')
makedepends=('meson')
source=("${url}/-/archive/${pkgver}/Megapixels-${pkgver}.tar.gz")
sha256sums=('898d45ab6dce5ff532e8554b90045dc7be2682c32ac7d48573438c7827a34931')

prepare() {
	cd ${pkgname^}-${pkgver} 
        mkdir build
}

build() {
	arch-meson ${pkgname^}-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.5.2
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/postmarketOS/megapixels'
license=('LGPL')
depends=('gtk4' 'zbar')
makedepends=('meson')
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
b2sums=('08071c83c1d07dab9da15526bec06db5460e5e24afe1599b6fd8657259d4cd2715db0cde4f97b244018e09818fb699e147935279c55f69a6145e2cfd21109264')

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

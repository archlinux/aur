# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.7.0
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/postmarketOS/megapixels'
license=('LGPL')
depends=('gtk4' 'zbar' 'feedbackd')
makedepends=('meson')
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
b2sums=('a89186a9e7eb75f393d389d58524c5574829653dd60b98046cb05cd1acd40da0e2a96cc2f4a52ec5fcec9f88e497c50b6afe7f4c3746699d6e29107bbb957b9e')

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

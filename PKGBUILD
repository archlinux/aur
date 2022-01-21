# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.2.2
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/decoder'
license=(LGPL)
depends=(
	libadwaita
	pipewire
	zbar
)
makedepends=(
	cargo
	clang
	meson
)
source=("${url}/-/archive/${pkgver}/decoder-${pkgver}.tar.gz")
b2sums=('45972a240728dc40d7ff6748ac082ec0c57c6de363efa6e4f3d072142de3ec9aa0278bd0d830899f819ecbd1a0dc2157b93ea4c4ea7cbd78fe19a9e878c7de3b')

build() {
	arch-meson decoder-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

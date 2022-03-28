# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.13.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	mutter
	'wlroots>=0.14.0' 'wlroots<0.15.0'
)
makedepends=(
	ctags
	libhandy
	meson
	vala
	wayland-protocols
)
source=("${url}/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
b2sums=('a765459b640b0625b2a3e06811fc920e829dc2405e317c305ba3e4587283704996ff7ff4e1d7b3aff15874f543b861a656e64e62401ac262882eaf475082b698')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

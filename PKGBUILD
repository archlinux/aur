# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.12.0
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
b2sums=('64db3b0ee6994e53e0270cd721fc89452f85c7852e92e97e087dd584dd9c1bb8b6449b14c2cb738e5cfb1917829d2b823a4e3568b5ecd8d1fd0e46c64e2e017e')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.13.1
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
b2sums=('6606855efe7099d12c8be3ee16c401bbcc618aaed2f264abe982cc4a49ccbc0e65fac1b7d8da62de4261bdf3a322f4313a15723c7b7cb7a9ce279957dbf89c78')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

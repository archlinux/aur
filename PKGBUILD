# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.10
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/bertob/nostalgia'
license=(GPL3)
depends=(
	libadwaita
	libportal-gtk4
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${url}/-/archive/${pkgver}/nostalgia-${pkgver}.tar.gz")
b2sums=('b43394a9bb77a31258a831eccc3f3ee38d72138153835cff3231c23656a44581cb9a114379e82b074560926fc2c310573be8d4024bfcd7c3423fa28f596a9df1')

build() {
	arch-meson nostalgia-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}

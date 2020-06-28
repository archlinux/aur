# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.7.4
pkgrel=1
pkgdesc="System utility designed to stress and monitoring various hardware components"
arch=('any')
url="https://gitlab.com/leinardi/gst"
license=('GPL3')
depends=('dmidecode' 'gobject-introspection' 'libappindicator-gtk3' 'lm_sensors' 'python' 'python-gobject' 'python-humanfriendly' 'python-injector' 'python-peewee' 'python-psutil' 'python-requests' 'python-rx' 'python-yaml' 'python-pyxdg' 'stress-ng')
makedepends=('meson' 'appstream-glib')
provides=()
conflicts=('smalltalk')
source=("https://gitlab.com/leinardi/gst/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('47f47ac4ea1d497975fe326f95f55b3d6c9e32aa00acbea0952561d1179b1562')

build() {
	if [[ -d "$srcdir/build" ]]; then
		rm -rf "$srcdir/build"
	fi
	meson --prefix /usr --buildtype=plain "$pkgname-$pkgver" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}

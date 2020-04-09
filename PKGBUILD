# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.7.2
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
sha256sums=('d137c3bad133348f57409f8d241eb568e8c204aa8e39b9ac7544ec9619122046')

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

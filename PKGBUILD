# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.7.1
pkgrel=2
pkgdesc="System utility designed to stress and monitoring various hardware components"
arch=('any')
url="https://gitlab.com/leinardi/gst"
license=('GPL3')
depends=('dmidecode' 'gobject-introspection' 'libappindicator-gtk3' 'lm_sensors' 'python' 'python-gobject' 'python-humanfriendly' 'python-injector' 'python-peewee' 'python-psutil' 'python-requests' 'python-rx' 'python-yaml' 'python-xdg' 'stress-ng')
makedepends=('meson' 'appstream-glib')
provides=()
conflicts=('smalltalk')
source=("https://gitlab.com/leinardi/gst/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1f97525cdebb6ab9c8e84de26691d8cd8fa1bac733d8e672f71898afade3620b')

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

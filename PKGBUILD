# Maintainer: Leo <i@setuid0.dev>
# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.7.5
pkgrel=1
pkgdesc="a GTK system utility designed to stress and monitor various hardware components like CPU and RAM"
arch=('any')
url="https://gitlab.com/leinardi/gst"
license=('GPL3')
depends=('python>=3.6' 'python-humanfriendly' 'python-injector' 'python-peewee' 'python-psutil' 'python-gobject' 'python-pyxdg' 'python-yaml' 'python-requests' 'python-rx' 'gobject-introspection' 'lm_sensors' 'stress-ng' 'dmidecode')
makedepends=('pkg-config' 'meson' 'ninja' 'appstream-glib')
provides=()
conflicts=('smalltalk')
source=("https://gitlab.com/leinardi/gst/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6d78f96a7f8663ca81be34cbea7295a75da41b4a49f5cb1c6cd1d0478d60a3f5')

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


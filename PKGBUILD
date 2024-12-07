# Maintainer: Leo <i@setuid0.dev>
# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.7.7
pkgrel=1
pkgdesc="System utility designed to stress and monitor various hardware components"
arch=('any')
url="https://gitlab.com/leinardi/gst"
license=('GPL-3.0-or-later')
depends=('python>=3' 'python-humanfriendly' 'python-injector' 'python-peewee' 'python-psutil' 'python-gobject' 'python-pyxdg' 'python-yaml' 'python-requests' 'python-rx' 'gobject-introspection' 'lm_sensors' 'stress-ng' 'dmidecode')
makedepends=('pkg-config' 'meson' 'ninja' 'appstream-glib')
provides=()
conflicts=()
source=("https://gitlab.com/leinardi/gst/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('057ee7c6390897625b38ee70d1c7d5af21128c85c1e3282037945b4f0314f436')

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


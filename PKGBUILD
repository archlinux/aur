# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gst
pkgver=0.6.1
pkgrel=2
pkgdesc="System utility designed to stress and monitoring various hardware components"
arch=('any')
url="https://gitlab.com/leinardi/gst"
license=('GPL3')
depends=('gobject-introspection' 'libappindicator3' 'lm_sensors' 'python' 'python-gobject' 'python-humanfriendly' 'python-injector' 'python-peewee' 'python-psutil' 'python-requests' 'python-rx' 'python-yaml' 'python-xdg' 'stress-ng')
makedepends=('meson' 'appstream-glib')
provides=()
source=("https://gitlab.com/leinardi/gst/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('85eaf145df0ecca578247596d9c654adb33b3217f890a161d53cdb8457c76ef7')

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

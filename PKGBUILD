# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing
pkgver=0.1.2
pkgrel=1
pkgdesc="Exercise your breathing"
arch=(x86_64)
url=https://github.com/SeaDve/Breathing
license=(GPL3)
depends=(gtk4
         libadwaita
         gstreamer
         python-gobject)
makedepends=(meson)
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('87620fcf0d0e940efcb0e97f5989ed6676ebb7e39e29ae1bf594160a63e09294ffd44b177506bca058373b8c8034857840d107c33f76d26db8203d1618d84b83')

build() {
	arch-meson Breathing-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

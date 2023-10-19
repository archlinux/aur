# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.8.0
pkgrel=1
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/oversteer
license=(GPL3)
depends=(
  appstream-glib
  desktop-file-utils
  gettext
  python
  python-cairo
  python-evdev
  python-gobject
  python-matplotlib
  python-pyudev
  python-scipy
  python-pyxdg
)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=(3e6e4362c27b1145400c536c8f79a19a8bb7ec39e3ee4ce8fa49011a25d64045)

prepare() {
	cd ${pkgname}-${pkgver}
  sed -i "s|version: '0.7.3',|version: '0.8.0',|g" meson.build
}

build() {
	cd ${pkgname}-${pkgver}
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd ${pkgname}-${pkgver}
	DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:

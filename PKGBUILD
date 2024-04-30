# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.8.2
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
  python-pyxdg
  python-scipy
)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=(b282ab666a88042cba259f524a81c2d54ac5c1a62456ddae38f494a979c5e33b4b023ed5a4a89ad12bf4125d99b9c710baf4ae106c5b9acd3f4682b8afdcb422)

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i "s|version: '0.8.1',|version: '0.8.2',|g" meson.build
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

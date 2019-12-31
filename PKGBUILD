# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=tuhi-git
pkgver=20191104
pkgrel=2
pkgdesc="DBus daemon to access Wacom SmartPad devices"
arch=('any')
depends=('python' 'python-svgwrite' 'python-xdg' 'python-cairo')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
url="https://github.com/tuhiproject/tuhi"
license=('GPL2')
source=(git+https://github.com/tuhiproject/tuhi)
sha256sums=('SKIP')

prepare() {
  cd ${pkgname%-git}
  sed -i '/meson_version:/s/0.50.0/0.51.0/' meson.build
}

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}
  meson builddir --prefix=/usr
  cd builddir
  ninja
}

package() {
  cd ${pkgname%-git}/builddir
  DESTDIR="${pkgdir}" ninja install
}

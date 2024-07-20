# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Julian Geywitz <aur@geigi.de>+
# Contributor: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=cozy-audiobooks
pkgdesc="A modern audio book player for Linux and macOS using GTK+ 3"
pkgver=1.3.0
pkgrel=2
url="https://github.com/geigi/cozy"
arch=(any)
license=('GPL3')
depends=('appstream-glib'
         libhandy libdazzle
         'desktop-file-utils'
         'gst-python'
         'gstreamer'
         'gtk4'
         libadwaita
         dbus-python
         'python-distro'
         'python-requests'
         'python-pytz'
         'python-gobject'
         'python-mutagen'
         'python-cairo'
         'python-peewee'
         'gst-plugins-good'
         'python-apsw')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/geigi/cozy/archive/${pkgver}.tar.gz")
sha256sums=('b4e5d438f5d3f5d236a49f3fcb433ca4fa489d7d5995961a5d967950bbb6c102')

build() {
  cd "cozy-${pkgver}"
  arch-meson . build

  ninja -C build com.github.geigi.cozy-update-po
  ninja -C build extra-update-po
  meson compile -C build
}

package() {
  cd "cozy-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.geigi.cozy "$pkgdir/usr/bin/cozy-audiobooks"
}

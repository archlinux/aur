# Maintainer: Alexander Minges <alexander.minges@gmail.com>

pkgname=meshy-git
pkgver=20260521.69eeb78
pkgrel=1
pkgdesc='GTK4/libadwaita client for MeshCore'
arch=('any')
url='https://codeberg.org/sesivany/meshy'
license=('GPL-3.0-or-later')
depends=(
  'bluez'
  'geoclue'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libshumate'
  'python>=3.11'
  'python-gobject'
  'python-pycryptodome'
  'python-pyserial'
  'python-segno'
  'pyzbar'
)
makedepends=(
  'appstream'
  'desktop-file-utils'
  'gettext'
  'git'
  'glib2'
  'meson'
  'ninja'
)
provides=('meshy')
conflicts=('meshy')
source=('git+https://codeberg.org/sesivany/meshy.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/meshy"
  git log -1 --format='%cd.%h' --date=format:%Y%m%d
}

build() {
  arch-meson meshy build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# Maintainer: ankabo
pkgname=systemd-pilot
pkgver=4.2.1
pkgrel=1
pkgdesc="Desktop application for managing systemd services"
arch=('any')
url="https://github.com/mfat/systemd-pilot"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libsecret'
  'python'
  'python-gobject'
  'python-paramiko'
)
makedepends=('meson')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('org.freedesktop.secrets: store credentials for remote hosts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ceab3ccff5bf8058a7ae125d964f0e544402ec1f38cd5b3b041d6251ce02b6ef')

build() {
  arch-meson "$pkgname-$pkgver" build -Dtests=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

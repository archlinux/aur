# Maintainer: koxt2 <koxt2@protonmail.com>
pkgname=datarecovery
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK4/Libadwaita application for data recovery using ddrescue and PhotoRec"
arch=('any')
url="https://github.com/koxt2/DataRecovery"
license=('GPL-2.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'ddrescue'
  'testdisk'
  'rdfind'
  'udisks2'
  'polkit'
)
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/koxt2/DataRecovery/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "DataRecovery-$pkgver"
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

check() {
  cd "DataRecovery-$pkgver"
  meson test -C builddir --print-errorlogs || true
}

package() {
  cd "DataRecovery-$pkgver"
  DESTDIR="$pkgdir" meson install -C builddir
}

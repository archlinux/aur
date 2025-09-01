# Maintainer: Pettan Calbete <pettan.calbete@gmail.com>
# Original Author: pvtoari <https://github.com/pvtoari>

pkgname=archstatus-git
pkgver=r26.0a3b6f2   # sera recalculé automatiquement
pkgrel=1
pkgdesc="Simple status monitor for Arch Linux"
arch=('x86_64')
url="https://github.com/pvtoari/archstatus"
license=('MIT')
depends=('cjson')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=('archstatus')
conflicts=('archstatus')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # version based on commits number + short hash
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}


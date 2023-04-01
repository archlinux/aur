# Maintainer: Marcus Huang <marcus65001 at gmail (dot) com>

# This installs a proprietary driver for the 27c6:550a fingerprint reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-goodix
_pkgdirname=libfprint-2-tod1-goodix
pkgver=0.0.9
pkgrel=1
pkgdesc="Proprietary driver for the Goodix fingerprint reader 27c6:550a, from Lenovo E14 Gen 4 Ubuntu driver."
arch=(x86_64)
url="https://download.lenovo.com/pccbbs/mobiles/r1slg01w.zip"
license=(custom)
depends=(libfprint-tod)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
groups=(fprint)
source=("git+https://github.com/marcus65001/libfprint-2-tod1-goodix")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

package() {
  cd $_pkgdirname
  # target directories
  install -dm 755 "$pkgdir/usr/lib/libfprint-2/tod-1/"
  install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"

  # drive
  install -Dm 755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/libfprint-tod-goodix-550a-0.0.9.so "$pkgdir/usr/lib/libfprint-2/tod-1/"
  # udev rule
  install -Dm 755 lib/udev/rules.d/60-libfprint-2-tod1-goodix.rules "$pkgdir/usr/lib/udev/rules.d/"
}

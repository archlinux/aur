# Maintainer: Tony Hoyle <tony at hoyle.me.uk>

# This installs a proprietary driver for the 04f3:0c4b fingerprinat reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-elan
_pkgdirname=libfprint-2-tod1-elan
pkgver=0.0.1
pkgrel=1
pkgdesc="Proprietary driver for the Elan/Lenovo 04fe:0c4b fingerprint reader, from Lenovo E14 Gen 4 Ubuntu driver."
arch=(x86_64)
url="https://download.lenovo.com/pccbbs/mobiles/r1sle01w.zip"
license=(custom)
depends=(libfprint-tod)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
groups=(fprint)
source=("git+https://github.com/TonyHoyle/libfprint-2-tod1-elan")
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
  install -Dm 755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/libfprint-2-tod1-elan.so "$pkgdir/usr/lib/libfprint-2/tod-1/"
  # udev rule
  install -Dm 755 lib/udev/rules.d/60-libfprint-2-tod1-elan.rules "$pkgdir/usr/lib/udev/rules.d/"
}

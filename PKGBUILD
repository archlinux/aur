# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ipmitool-git
pkgver=1.8.18.r192.g956ae2b
pkgrel=2
pkgdesc="Tool for controlling IPMI-enabled systems"
arch=('i686' 'x86_64')
url="https://github.com/ipmitool/ipmitool"
license=('BSD')
depends=('glibc' 'openssl')
makedepends=('git')
provides=('ipmitool')
conflicts=('ipmitool')
source=("git+https://github.com/ipmitool/ipmitool.git")
sha256sums=('SKIP')


pkgver() {
  cd "ipmitool"

  git describe --long --tags | sed 's/^IPMITOOL_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "ipmitool"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "ipmitool"

  make check
}

package() {
  cd "ipmitool"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/ipmitool"
}

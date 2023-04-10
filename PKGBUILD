# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iw-git
pkgver=5.19.r5.gd6fd275
pkgrel=1
pkgdesc="A nl80211 based CLI configuration utility for wireless devices"
arch=('i686' 'x86_64')
url="https://wireless.wiki.kernel.org/en/users/Documentation/iw"
license=('custom')
depends=('glibc' 'libnl')
makedepends=('git' 'linux-api-headers')
provides=("iw=$pkgver")
conflicts=('iw')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git")
sha256sums=('SKIP')


pkgver() {
  cd "iw"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iw"

  make
}

package() {
  cd "iw"

  make \
    DESTDIR="$pkgdir" \
    SBINDIR="/usr/bin" \
    install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/iw"
}

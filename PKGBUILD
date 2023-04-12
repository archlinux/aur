# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openresolv-git
pkgver=3.12.0.r5.g24d2882
pkgrel=1
pkgdesc="The DNS management framework"
arch=('any')
url="https://roy.marples.name/projects/openresolv"
license=('BSD')
depends=('sh')
makedepends=('git')
provides=("openresolv=$pkgver")
conflicts=('openresolv')
backup=('etc/resolvconf.conf')
source=("git+https://github.com/NetworkConfiguration/openresolv.git")
sha256sums=('SKIP')


pkgver() {
  cd "openresolv"

  git describe --long --tags | sed 's/^openresolv-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openresolv"

  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib/resolvconf"
  make
}

package() {
  cd "openresolv"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openresolv"
}

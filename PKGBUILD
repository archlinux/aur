# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pacoloco-hub-git
pkgver=r1.e774513
pkgrel=1
pkgdesc='Local network caching service for pacman'
arch=(i686 x86_64)
url='https://github.com/anatol/pacoloco.cr'
license=(GPL3)
depends=(libunwind gc openssl pcre)
makedepends=(crystal)
source=(git://github.com/anatol/pacoloco.cr)
sha1sums=('SKIP')

pkgver() {
  cd pacoloco.cr
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd pacoloco.cr
  crystal build --release server.cr
}

package() {
  cd pacoloco.cr
  install -Dm755 server $pkgdir/usr/bin/pacoloco-hub
  install -Dm644 pacoloco-hub.service $pkgdir/usr/lib/systemd/system/pacoloco-hub.service
}

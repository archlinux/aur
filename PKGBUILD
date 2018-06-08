# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pacoloco-git
pkgver=r21
pkgrel=1
pkgdesc='Lightweight pacman proxy server'
arch=(i686 x86_64)
url='https://github.com/anatol/pacoloco'
backup=(etc/pacoloco.ini)
license=(GPL3)
depends=(glibc)
makedepends=(git ragel)
source=(git://github.com/anatol/pacoloco)
sha1sums=('SKIP')

pkgver() {
  cd pacoloco
  # repo does not have any git tags yet
  echo r$(git rev-list --count master)
}

build() {
  cd pacoloco
  make
}

package() {
  cd pacoloco
  install -D -m755 pacoloco "$pkgdir"/usr/bin/pacoloco
  install -D -m644 systemd/pacoloco.service "$pkgdir"/usr/lib/systemd/system/pacoloco.service
  install -D -m644 pacoloco.ini "$pkgdir"/etc/pacoloco.ini
}

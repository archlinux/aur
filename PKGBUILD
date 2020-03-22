# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pacoloco-git
pkgver=r16
pkgrel=1
pkgdesc='Pacman caching proxy server'
arch=(x86_64 armv7h)
url='https://github.com/anatol/pacoloco'
backup=(etc/pacoloco.yaml)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=(git://github.com/anatol/pacoloco)
sha1sums=('SKIP')

pkgver() {
  cd pacoloco
  # repo does not have any git tags yet
  echo r$(git rev-list --count master)
}

build() {
  cd pacoloco
  go build
}

package() {
  cd pacoloco
  install -D -m755 pacoloco "$pkgdir"/usr/bin/pacoloco
  install -D -m644 pacoloco.yaml.sample "$pkgdir"/etc/pacoloco.yaml
  install -D -m644 pacoloco.sysusers.d "$pkgdir"/usr/lib/sysusers.d/pacoloco.conf
  install -D -m644 pacoloco.service "$pkgdir"/usr/lib/systemd/system/pacoloco.service
  install -D -m644 pacoloco.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/pacoloco.conf
}

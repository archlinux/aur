# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=disque-git
pkgver=d01f47d
pkgrel=2
pkgdesc="Distributed message broker"
arch=('any')
url="https://github.com/antirez/disque"
license=(MIT)
provides=('disque')
source=("$pkgname::git+$url") 
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm644 ${srcdir}/${pkgname}/disque.conf ${pkgdir}/etc/disque/disque.conf
  install -Dm755 ${srcdir}/${pkgname}/src/disque ${pkgdir}/usr/bin/disque
  install -Dm755 ${srcdir}/${pkgname}/src/disque-server ${pkgdir}/usr/bin/disque-server
}

# vim:set ts=2 sw=2 et:

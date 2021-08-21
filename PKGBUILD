# Maintainer: Jan Samek <samekh@email.cz>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_prj=trellis
_targets="ECP5 MachXO2"
_pkgname=prj$_prj-db
pkgname=$_pkgname-git
pkgver=r267.fdf4bf2
pkgrel=1
pkgdesc='Project Trellis (Lattice ECP5 bit-stream format) database'
arch=('any')
url="https://github.com/YosysHQ/$_pkgname"
license=('custom:CC0')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')
provides=('prjtrellis-db')
conflicts=('prjtrellis-db')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  install -dm 755 "$pkgdir"/usr/share/$_prj/database
  cp -r --no-preserve=ownership devices.json $_targets "$pkgdir"/usr/share/$_prj/database/

  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}


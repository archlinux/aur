# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_targets='artix7 kintex7 zynq7'
_prj=xray
_pkgname=prj$_prj-db
pkgname=$_pkgname-git
pkgver=r238.fcd2764
pkgrel=1
pkgdesc='Project X-Ray (Xilinx 7-series bit-stream format) database'
arch=('any')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
url="https://github.com/SymbiFlow/$_pkgname"
license=('custom:CC0')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  install -dm 755 "$pkgdir"/usr/share/$_prj/database
  cp -r --no-preserve=ownership $_targets "$pkgdir"/usr/share/$_prj/database/

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


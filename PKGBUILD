# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_targets='artix7 kintex7 zynq7'
_prj=xray
_pkgname=prj$_prj-db
pkgname=$_pkgname-git
pkgver=r244.057e179
pkgrel=2
pkgdesc='Project X-Ray (Xilinx 7-series bit-stream format) database'
arch=('any')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
url="https://github.com/SymbiFlow/$_pkgname"
license=('custom:CC0')
makedepends=('git')
source=("git+$url.git"
        "prj$_prj-config")
sha512sums=('SKIP'
            '655823764e9e9ca2793e9a96cbc472851c50d2b355bc2538dd73211cc8ec9188e31e89902e8c4bc1fac53a9db869fcf7ed4753d4505cb6ca2464d6a881aabcc4')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  install -dm 755 "$pkgdir"/usr/share/$_prj/database
  cp -r --no-preserve=ownership $_targets "$pkgdir"/usr/share/$_prj/database/

  install -Dm 755 "$srcdir/prj$_prj-config" "$pkgdir/usr/bin/prj$_prj-config"

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


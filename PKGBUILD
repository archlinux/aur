# Maintainer: willemw <willemw12@gmail>
#
# From 'ulipad' package:
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TDY <tdy@gmx.com>
# Contributor: NicolÃ¡s de la Torre <ndelatorre@gmail.com>

_pkgname=ulipad
pkgname=$_pkgname-git
pkgver=r10.c8627cb
pkgrel=1
pkgdesc="A wxPython powered, programmer oriented and flexible editor"
arch=('any')
url="https://github.com/limodou/ulipad"
license=('GPL')
depends=('wxpython')
optdepends=('psyco: speed support'
            'python2-pyenchant: spell-checking support')
source=($pkgname::git://github.com/limodou/ulipad.git
        $_pkgname.desktop
        $_pkgname.png
        $_pkgname.sh)
md5sums=('SKIP'
         '8179bab501c1eea2a799f497292b4549'
         '088feea9980edd118c7297e6d45613af'
         '23cdc38822e51dc6ffaa86dff94d967d')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  find . -name "*.py*" -exec sed -i "s|env python|env python2|" '{}' \;
  find . -name "*.py*" -exec sed -i "s|/usr/bin/python|/usr/bin/python2|" '{}' \;
}

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

  cd $pkgname
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r ./* "$pkgdir/usr/share/$_pkgname"
}


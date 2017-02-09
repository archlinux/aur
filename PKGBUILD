# Maintainer: Frantisek Fladung

_pkgname=dmenu
pkgname=$_pkgname-ametisf-git
pkgver=550.5731797
pkgrel=1
pkgdesc="Wayland port of dmenu - ametisf fork"
url="https://github.com/ametisf/dmenu"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'wld')
makedepends=('git' 'libx11' 'swc' 'tup')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/ametisf/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build(){
  cd $srcdir/$_pkgname
  tup init
  tup upd
}

package() {
  mkdir -p $pkgdir/usr/{bin,share/licenses/$pkgname}
  install -m 755 $_pkgname/dmenu $pkgdir/usr/bin
  install -m 755 $_pkgname/dmenu_path $pkgdir/usr/bin
  install -m 755 $_pkgname/dmenu_run $pkgdir/usr/bin
  install -m 755 $_pkgname/stest $pkgdir/usr/bin
  install -m 644 $_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname
}

# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

_pkgname=diagrammer
_sbtver=2.12.7
pkgname=diagrammer-git
pkgver=r81.18bae5b
pkgrel=1
pkgdesc='Provides dot visualizations of chisel/firrtl circuites'
arch=('any')
url='https://github.com/freechipsproject/diagrammer/'
license=('BSD')
provides=('diagrammer')
conflicts=('diagrammer')
depends=('java-environment')
makedepends=('mill' 'git')
source=('git+https://github.com/freechipsproject/diagrammer.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build(){
  cd $srcdir/$_pkgname
  mill "$_pkgname.assembly"
}

package() {
  install -d $pkgdir/usr/share/licenses/$_pkgname
  install -d $pkgdir/usr/bin
  install -Dm755 $srcdir/$_pkgname/out/$_pkgname/$_sbtver/assembly/dest/out.jar $pkgdir/usr/bin/$_pkgname
  install -Dm644 $srcdir/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt
}

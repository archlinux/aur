# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

_pkgname=diagrammer
_sbtver=2.12.7
pkgname=diagrammer-git
pkgver=r80.aa501ef
pkgrel=1
pkgdesc='Provides dot visualizations of chisel/firrtl circuites'
arch=('any')
url='https://github.com/freechipsproject/diagrammer/'
license=('BSD')
provides=('diagrammer')
conflicts=('diagrammer')
depends=('java-environment')
makedepends=('sbt' 'git')
source=('git+https://github.com/sequencer/diagrammer#branch=mill_fix'
       'diagrammer.sh')
md5sums=('SKIP'
         '73a883d13e66eae2255be88ae6eeab3f')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build(){
  cd $srcdir/$_pkgname
  mill "$_pkgname[$_sbtver].assembly"
}

package() {
  install -d "$pkgdir"/usr/share/licenses/"$_pkgname"
  install -d "$pkgdir"/usr/bin
  install -Dm755 $srcdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname
  install -Dm755 $srcdir/$_pkgname/out/$_pkgname/$_sbtver/assembly/dest/out.jar $pkgdir/usr/share/scala/$_pkgname/$_pkgname.jar
  install -Dm644 $srcdir/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt
}

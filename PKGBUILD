# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.43.05
_pkgver=$pkgver-alpha4
pkgrel=2
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="http://dfhack.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=(bash
         dwarffortress=$pkgver
         lua
         protobuf)

conflicts=(dfhack dfhack-git)

source_i686=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-32-gcc-4.8.1.tar.bz2)
source_x86_64=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64-gcc-4.8.1.tar.bz2)

md5sums_i686=('d909d24f1a258e6750405863076eb3c1')
md5sums_x86_64=('1666bcafa4b0afdfd45f9149227cfcf3')

source=(dfhack.sh
        dfhack-run.sh)

md5sums=('81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')

package() {
  install -d $pkgdir/opt/dwarffortress

  # TODO add stonesense, once it is included again
  cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example} $pkgdir/opt/dwarffortress

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

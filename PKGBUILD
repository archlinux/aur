# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.43.05
_pkgver=$pkgver-beta1
pkgrel=3
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

source=(dfhack.sh
        dfhack-run.sh)

package() {
  install -d $pkgdir/opt/dwarffortress

  # TODO add stonesense, once it is included again
  cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example} $pkgdir/opt/dwarffortress

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')
md5sums_x86_64=('bcc23efc95ef3d799554a7c8b54bc010')
md5sums_i686=('3d1a3daddb52dcba8a45362ca26d8065')

# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.44.03
_pkgver=$pkgver-beta1
pkgrel=1
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="http://dfhack.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=("dwarffortress=$pkgver" lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama)

conflicts=(dfhack dfhack-git)
provides=(dfhack)

source_i686=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-32-gcc-5.4.0.tar.bz2)
source_x86_64=(https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64-gcc-5.4.0.tar.bz2)
source=(dfhack.sh
        dfhack-run.sh)

md5sums_x86_64=('ec64b8de46babe8a96703d2ca0e6ae16')
md5sums_i686=('6e2c4685ca439f835af9fa5b83a43dc3')
md5sums=('81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')

prepare() {
  sed -e 's|setarch i386 -R ||' \
      -i $srcdir/dfhack
}

package() {
  install -d $pkgdir/opt/dwarffortress

  cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example,stonesense} $pkgdir/opt/dwarffortress

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

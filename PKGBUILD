# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.43.03
_pkgver=$pkgver-alpha1
pkgrel=1
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="http://dfhack.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=(dwarffortress=$pkgver)

if test "$CARCH" == "x86_64" ; then
  depends+=(lib32-libpng12 lib32-libjpeg6-turbo)
fi

conflicts=(dfhack dfhack-git)

source=("$_pkgname-$_pkgver.tar.bz2::https://github.com/DFHack/dfhack/releases/download/$_pkgver/$_pkgname-$_pkgver-Linux-gcc-4.8.1.tar.bz2"
        dfhack.sh
        dfhack-run.sh)

md5sums=('031825dcd6d5026ca3db23350c025d0d'
         '81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')

package() {
  install -d $pkgdir/opt/dwarffortress

  cp -r $srcdir/{hack,stonesense,dfhack,dfhack-run,dfhack-config,dfhack.init-example} $pkgdir/opt/dwarffortress

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

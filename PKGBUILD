# Maintainer:  Seylerius <seylerius@seriouslyseylerius.com>
pkgname=dfhack
_pkgver=0.40.24-r3
pkgver=0.40.24_r3
pkgrel=1
pkgdesc="A Dwarf Fortress memory access library and a set of basic tools that use it."
url="https://github.com/DFHack/dfhack"
arch=('i686' 'x86_64')
license=('custom')
depends=('dwarffortress=0.40.24')
if test "$CARCH" == "x86_64"; then
  depends+=(lib32-libpng12 lib32-libjpeg6)
fi
conflicts=(dfhack-git)
source=("$pkgname-$pkgver.tar.bz2::https://github.com/DFHack/dfhack/releases/download/0.40.24-r3/dfhack-0.40.24-r3-Linux-gcc-4.9.2.tar.bz2" "dwarffortress-hacked" "dfhack-run")
sha256sums=('e36984c06aa8c0865bcccba9869413709a5429b52f83dbf2771cfa5e6d3f2d36'
            '8d68139fb2cbb49a25999462974bff5c40ba23028c823fb666507fbc151ac52d'
            'f11870300ccd8908733c8869f93ae48b22130ee338412ffcae6f8228875db747')
package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/dwarffortress
  cp -r hack stonesense dfhack dfhack-run dfhack.init-example $pkgdir/opt/dwarffortress
  cd ..
  install -Dm755 dwarffortress-hacked $pkgdir/usr/bin/dfhack
  install -Dm755 dfhack-run $pkgdir/usr/bin/dfhack-run
}

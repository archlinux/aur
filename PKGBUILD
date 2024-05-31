# Maintainer:  rodakay5 @ gmail.com

pkgname=adaogg
pkgver=2021.10.14
pkgrel=1
pkgdesc="A complete interface layer that brings the Ogg, Vorbis, and Theora libraries to the Ada 2012 programming language."

arch=(i686 x86_64)
url=https://phasercat.com/adaogg
license=(GPL3)

makedepends=(gprbuild)

source=(https://phasercat.com/wp-content/uploads/2020/08/adaogg_10142021.zip
        adaogg.gpr
        debug.pra)
sha256sums=(30d2d50c3f6dc9d6998ced24dd26cb52a097c1b768e74b397ab8cfe2ae709c8a
            1d90650a88548354357f843cd3396a883493105a981492fbfefee088094ad128
            4514c213830bce24e2290046238e768daa54c7552d824afd832e018f5bcdffd9)

prepare()
{
   cd $srcdir/adaogg
   
   cp ../adaogg.gpr .
   cp ../debug.pra  .
}


build()
{
   cd $srcdir/adaogg

   gprbuild -P adaogg
}


package()
{
   cd $srcdir/adaogg

   gprinstall -p -P adaogg.gpr --prefix="$pkgdir/usr"

   # Install the license.
   #
   install -D -m644     \
      "License.txt"     \
      "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
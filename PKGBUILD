# Maintainer:  rodakay5 @ gmail.com

pkgname=vulkada
pkgver=2023.4.8
pkgrel=1
pkgdesc="A complete Vulkan 1.1 binding for the Ada 2012 programming language."
arch=('i686' 'x86_64')
url="https://phasercat.com/vulkada/"
license=('GPL3')

makedepends=(gprbuild)

source=(https://phasercat.com/wp-content/uploads/2020/08/vulkada_08042023.zip
        vulkada.gpr
        debug.pra)
sha256sums=(a7eb78a5819bfb8c511872e61edf243edf657d3e25026954e46a9e2da608728a
            6a1d3c00ea491f354ac76d91a23738406e15c1e4d68520f358b4b7f3c0abfa28
            4514c213830bce24e2290046238e768daa54c7552d824afd832e018f5bcdffd9)

prepare()
{
   cd "$srcdir/vulkada"
   
   cp ../vulkada.gpr .
   cp ../debug.pra   .
}


build()
{
   cd "$srcdir/vulkada"

   gprbuild -P vulkada
}


package()
{
   cd "$srcdir/vulkada"

   gprinstall -p -P vulkada.gpr --prefix="$pkgdir/usr"

   # Install the license.
   install -D -m644 \
      "License.txt"     \
      "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
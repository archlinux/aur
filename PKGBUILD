# Maintainer:  rodakay5 @ gmail.com

pkgname=vulkada
pkgver=2025.3.1
pkgrel=1
pkgdesc="A complete Vulkan 1.4 thick binding for the Ada 2012 programming language."

arch=(i686 x86_64)
url=https://phasercat.com/vulkada
license=(GPL3)

makedepends=(gprbuild)

source=(https://phasercat.com/wp-content/uploads/2020/08/vulkada_03012025.zip
        vulkada.gpr
        debug.pra
        vulkan-extensions-khr_surface_protected_capabilities_c.ads
        vulkan-extensions-khr_surface_protected_capabilities_c.adb)

sha256sums=(c214bf1b0ef38ab891f4c6c1fffb8eb159d31fee64485db4910d46fff985d014
            6a1d3c00ea491f354ac76d91a23738406e15c1e4d68520f358b4b7f3c0abfa28
            4514c213830bce24e2290046238e768daa54c7552d824afd832e018f5bcdffd9
            7995224d284bb31d3078f79755ea4481deb0e3edb0763a3142c42f4f001dcf2e
            429de3b36e9cb9580212b8cf2d7fef503ce48ac0a59f84a53dd89051648ba613)

prepare()
{
   cd $srcdir/vulkada
   
   cp ../vulkada.gpr .
   cp ../debug.pra   .
   
   rm ./vulkada/vulkan-extensions-khr_surface_protected_capabilities.ads
   rm ./vulkada/vulkan-extensions-khr_surface_protected_capabilities.adb
   
   cp ../vulkan-extensions-khr_surface_protected_capabilities_c.ads ./vulkada
   cp ../vulkan-extensions-khr_surface_protected_capabilities_c.adb ./vulkada
}


build()
{
   cd $srcdir/vulkada

   gprbuild -P vulkada
}


package()
{
   cd $srcdir/vulkada

   gprinstall -p -P vulkada.gpr --prefix="$pkgdir/usr"

   # Install the license.
   install -D -m644 \
      "License.txt"     \
      "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
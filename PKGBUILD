# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
epoch=1
pkgver=22.0.0
pkgrel=1

pkgdesc="A high level string and text processing library for Ada."
url="https://github.com/AdaCore/VSS"

arch=('i686' 'x86_64')
license=('GPL3' 'custom')

makedepends=('gprbuild')
         
source=("https://github.com/AdaCore/VSS/archive/refs/heads/22.0.zip")
sha1sums=(909c092bbe2626ce18f46ca37c55d04226335d01)

build()
{
   cd "$srcdir/VSS-22.0"
   make all
}

package()
{
   cd "$srcdir/VSS-22.0"

   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_json.gpr
   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_text.gpr
   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_gnat.gpr

   # Install the license.
   install -D -m644     \
      "COPYING3"        \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

   # Install the custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

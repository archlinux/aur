# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
epoch=1
pkgver=21.0.0
pkgrel=1

pkgdesc="A high level string and text processing library for Ada."
url="https://github.com/AdaCore/VSS"

arch=('i686' 'x86_64')
license=('GPL3' 'custom')

makedepends=('gprbuild')
         
_version=2021-20210701-198AA-src
_hash=b3b6db7b27ef26dc9006e062dd1bf7adbe47566b

source=("$pkgname-$pkgver.tar.gz::https://community.download.adacore.com/v1/$_hash?filename=$pkgname-$_version.tar.gz&rand=669")
sha1sums=($_hash)

_name=vss

build()
{
   cd "$srcdir/$_name-$_version"
   make all
}

package()
{
   cd "$srcdir/$_name-$_version"

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

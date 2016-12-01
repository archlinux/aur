# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.1.9
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/devernay/openfx-misc/tree/Natron-$pkgver"
license=("GPL2")
makedepends=("git")
depends=("libgl" "gcc-libs-multilib")
source=("$pkgname::git://github.com/devernay/openfx-misc.git#tag=Natron-$pkgver"
        "git+https://github.com/devernay/openfx.git"
        "git+https://github.com/devernay/openfx-supportext.git")
md5sums=("SKIP"
         "SKIP"
         "SKIP")
_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release BITS=$_bits
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins CONFIG=release BITS=$_bits
}

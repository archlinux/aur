# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc-git
name=openfx-misc
pkgver=2.3.4
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/devernay/openfx-io"
license=("GPL2")
depends=("seexpr1" "openimageio" "ffmpeg") 
#depends=("opencolorio" "openexr" "openimageio" "ffmpeg" "boost-libs")
makedepends=("git" "expat" "boost")
optdepends=("openfx-gmic-bin" "natron-plugins")
com=945b91448c4e221578f36bb619c01ddd39e39f83
source=("openfx-misc::git+https://github.com/devernay/openfx-misc.git#commit=$com"
)
sha512sums=('SKIP'
)

_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

prepare() {
  cd "$srcdir/$name"
 git submodule update --init --recursive
}

build() {
  cd "$srcdir/$name"
  make CONFIG=release BITS=$_bits
}

package() {
  cd "$srcdir/$name"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins CONFIG=release BITS=$_bits
}
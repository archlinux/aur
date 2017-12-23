# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena-git
name=openfx-arena
pkgver=2.3.5
pkgrel=2
arch=("x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/MrKepzie/openfx-io"
license=("GPL2")
depends=("seexpr" "openimageio" "ffmpeg") 
#depends=("opencolorio" "openexr" "openimageio" "ffmpeg" "boost-libs")
makedepends=("git" "expat" "boost")
optdepends=("openfx-gmic-bin" "natron-plugins")
com=c6912ee16d4eed411ad3fa5e3cf769b06647f03f
source=("openfx-arena::git+https://github.com/MrKepzie/openfx-arena.git#commit=$com"
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
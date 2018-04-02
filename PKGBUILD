# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena-git
name=openfx-arena
pkgver=2.3.10
pkgrel=1
arch=("x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/MrKepzie/openfx-io"
license=("GPL2")
depends=("seexpr" "openimageio" "ffmpeg") 
#depends=("opencolorio" "openexr" "openimageio" "ffmpeg" "boost-libs")
makedepends=("git" "expat" "boost")
optdepends=("openfx-gmic-bin" "natron-plugins")
com=7da90f3f855d880572a9214445ba861a884a9132
source=("$name::git+https://github.com/NatronGitHub/openfx-arena.git#commit=$com"
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

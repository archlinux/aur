# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_arena_commit=53cb2e9
_lodepng_commit=e34ac04
_openfx_commit=db5aa97
_openfx_io_commit=4b84d12
_openfx_supportext_commit=53c12bd
_SequenceParsing_commit=1bbcd07
_tinydir_commit=3aae922

pkgname=openfx-arena
pkgver=2.3.15_rc19
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL')
depends=('libcdr' 'libgl' 'libmagick' 'librsvg' 'libxt' 'libzip' \
        'opencolorio' 'poppler-glib' 'sox')
makedepends=('pango')
source=("openfx-arena_$_openfx_arena_commit.tar.gz::https://github.com/NatronGitHub/openfx-arena/tarball/$_openfx_arena_commit"
        "lodepng_$_lodepng_commit.tar.gz::https://github.com/lvandeve/lodepng/tarball/$_lodepng_commit"
        "openfx_$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit"
        "openfx-supportext_$_openfx_supportext_commit.tar.gz::https://github.com/NatronGitHub/openfx-supportext/tarball/$_openfx_supportext_commit"
        "openfx-io_$_openfx_io_commit.tar.gz::https://github.com/NatronGitHub/openfx-io/tarball/$_openfx_io_commit"
        "SequenceParsing_$_SequenceParsing_commit.tar.gz::https://github.com/NatronGitHub/SequenceParsing/tarball/$_SequenceParsing_commit"
        "tinydir_$_tinydir_commit.tar.gz::https://github.com/NatronGitHub/tinydir/tarball/$_tinydir_commit")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

_pkgname="NatronGitHub-$pkgname-$_openfx_arena_commit"

prepare() {
  tar -xzf "$srcdir/lodepng_$_lodepng_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/lodepng"

  tar -xzf "$srcdir/openfx_$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX/"
  tar -xzf "$srcdir/openfx-io_$_openfx_io_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX-IO/"
  tar -xzf "$srcdir/openfx-supportext_$_openfx_supportext_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/SupportExt/"

  tar -xzf "$srcdir/openfx_$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX-IO/openfx/"
  tar -xzf "$srcdir/openfx-supportext_$_openfx_supportext_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX-IO/SupportExt/"

  tar -xzf "$srcdir/SequenceParsing_$_SequenceParsing_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX-IO/IOSupport/SequenceParsing/"
  tar -xzf "$srcdir/tinydir_$_tinydir_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/OpenFX-IO/IOSupport/SequenceParsing/tinydir/"
}

build() {
  cd "$srcdir/$_pkgname"
  make CONFIG=release
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release
}

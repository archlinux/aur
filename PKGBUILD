# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_misc_commit=e0e1686
_openfx_commit=53d86e2
_openfx_supportext_commit=6f7cdfe

pkgname=openfx-misc
pkgver=2.3.15_rc12
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=('GPL')
makedepends=('openmp')
depends=('libgl')
optdepends=('natron-plugins: More presets for the Shadertoy plugin')
source=("openfx-misc_$_openfx_misc_commit.tar.gz::https://github.com/NatronGitHub/openfx-misc/tarball/$_openfx_misc_commit"
        "openfx_$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit"
        "openfx-supportext_$_openfx_supportext_commit.tar.gz::https://github.com/NatronGitHub/openfx-supportext/tarball/$_openfx_supportext_commit")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

_pkgname="NatronGitHub-$pkgname-$_openfx_misc_commit"

prepare() {
  tar -xzf "$srcdir/openfx_$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/openfx/"
  tar -xzf "$srcdir/openfx-supportext_$_openfx_supportext_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/SupportExt/"
}

build() {
  cd "$srcdir/$_pkgname"
  make CONFIG=release \
       CXXFLAGS_ADD=-fopenmp \
       LDFLAGS_ADD=-fopenmp
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release
}

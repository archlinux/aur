# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_openfx_gmic_commit=7a047f0
_openfx_commit=1645fd7

pkgname=openfx-gmic
pkgver=2.3.15_rc15
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=('curl' 'fftw' 'libgl' 'libpng')
makedepends=('gimp' 'opencv' 'openexr' 'qt5-base')
source=("openfx-gmic_$_openfx_gmic_commit.tar.gz::https://github.com/NatronGitHub/openfx-gmic/tarball/$_openfx_gmic_commit"
        "openfx_$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit")
sha512sums=('SKIP'
            'SKIP')

_pkgname="NatronGitHub-$pkgname-$_openfx_gmic_commit"

prepare() {
  tar -xzf "$srcdir/openfx_$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/openfx/"
}

build() {
  cd "$srcdir/$_pkgname"
  make CONFIG=release
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 $srcdir/$_pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$_pkgname/Licence_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$_pkgname/Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
}

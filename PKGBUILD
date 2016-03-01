# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=2dtiler-bin
_pkgname=2dtiler
pkgver=2.0
pkgrel=1
pkgdesc="Interactive viewer for periodic tilings of all three two-dimensional geometries"
arch=('i686' 'x86_64')
url="http://ab.inf.uni-tuebingen.de/software/2dtiler/"
license=('unknown')
provides=('2dtiler')
conflicts=('2dtiler')
source=("http://ab.inf.uni-tuebingen.de/software/${_pkgname}/${_pkgname}${pkgver//./}.zip"
        "2dt")
sha256sums=('88d28b6486b9b455a9da876460d6e4ba62c96430874e5031e8cbb65ca2c63e1f'
            'ffb944968f751a6ed052ff04f1052a632fec3a4db23916ab1228de2be481e032')

if [ "$CARCH" == 'i686' ]; then
  depends=('freeglut' 'libxmu')
elif [ "$CARCH" == 'x86_64' ]; then
  depends=('lib32-freeglut' 'lib32-libxmu')
fi

prepare() {
  cd $_pkgname
  find . -name CVS -prune -exec rm -rf {} \;
  rm 2dt manual.pdf
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -dr --no-preserve='ownership' $_pkgname "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/2dt" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:


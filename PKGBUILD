# Maintainer: Kamil Stachowski <kamil.stachowski@gmail.com>
# Updated: Julien Schueller

pkgname=tralics
pkgver=2.15.1
pkgrel=1
pkgdesc="LaTeX to XML translator"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/apics/tralics/"
license=('custom:CeCILL')
depends=('gcc-libs')
makedepends=('gcc' 'texlive-latexextra')
options=()
source=("ftp://ftp-sop.inria.fr/marelle/$pkgname/src/$pkgname-src-$pkgver.tar.gz")
md5sums=('e946ebb37919cd900d7e2bf6c71261fc')

build() {
  tar xzf ${pkgname}-src-${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}
  make -C src CPPFLAGS="$CPPFLAGS -DCONFDIR=\\\"/usr/share/tralics\\\""
}

check() {
  cd ${pkgname}-${pkgver}
  cd Test
  sed -i "/testerr/d" alltests
  ./alltests
}

package() {
  cd ${pkgname}-${pkgver}
  install -D -m755 src/tralics $pkgdir/usr/bin/tralics
  rm confdir/README confdir/COPYING confdir/tralics_rc
  install -d ${pkgdir}/usr/share
  cp -r confdir ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/tralics/
  cp Licence_CeCILL_V2-en.txt ${pkgdir}/usr/share/licenses/tralics/
}

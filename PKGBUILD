# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=tralics
pkgver=2.15.3
pkgrel=1
pkgdesc="LaTeX to XML translator"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/apics/tralics/"
license=('custom:CeCILL')
depends=('gcc-libs')
makedepends=('gcc' 'texlive-latexextra')
options=()
source=("ftp://ftp-sop.inria.fr/marelle/$pkgname/src/$pkgname-src-$pkgver.tar.gz")
md5sums=('11b1908f61917fe2ee17426b2e76184c')

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

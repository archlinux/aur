# Maintainer: Michele Mocciola <mickele>

pkgname=eficas
pkgver=7.4.0
pkgrel=1
pkgdesc="ASter Command FIle Editor. Editor of Code_Aster's command files."
url="http://www.code-aster.org/"
license="GPL"
depends=('python2' 'python2-pyqt' 'python2-numpy')
makedepends=('desktop-file-utils' 'gcc-fortran')
arch=('i686' 'x86_64')
source=('http://www.code-aster.org/FICHIERS/aster-full-src-11.6.0-1.noarch.tar.gz' 'eficas.png' 'eficas.desktop')

build() {
    cd "${srcdir}/aster-full-src-11.6.0"
    sed -e "s|should_continue()|# should_continue()|g" -i setup.py
}

package() {
  cd "${srcdir}/aster-full-src-11.6.0"

  python2 setup.py install --prefix="${pkgdir}/opt/eficas" eficas
  sed -e "s|python|python2|" -i "${pkgdir}/opt/eficas/public/${pkgname}-${pkgver}/eficasQt"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s /opt/eficas/bin/eficas "${pkgdir}/usr/bin/"

  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"
}
md5sums=('e48db35defbb1e431b8a686b856f4596'
         '246438dfb94a62aff24fcd7b05f5a7d7'
         '0315674d3dd04af7f2125576d651a94b')

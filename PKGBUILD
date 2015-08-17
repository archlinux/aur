# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=g_lomepro
_gromacs=gromacs-4.6.7
pkgver=1.0.2
pkgrel=2
pkgdesc='Local Membrane Property Analysis'
url='http://www3.mpibpc.mpg.de/groups/grubmueller/start/g_lomepro.html'
license=("GPL")
arch=('i686' 'x86_64')
depends=('gromacs-4.6-complete=4.6.7')
options=('!libtool')
source=('http://www3.mpibpc.mpg.de/groups/grubmueller/start/g_lomepro_v1.0.2.tar')
sha1sums=('902f4e4329136572f6f54ff293c354a5c30d82c9')

build() {
  source /usr/local/gromacs/${_gromacs}/bin/GMXRC
  cd ${srcdir}/${pkgname}_v${pkgver}
  sed -e "s:/home/vgapsys/Downloads/gromacs-4.6.2/gromacs/src/tools:/usr/local/gromacs/${_gromacs}/src/tools:" \
      -e "s:/home/vgapsys/gromacs-462_clean/include/gromacs:/usr/local/gromacs/${_gromacs}/include/gromacs/:" \
      -e "s:/home/vgapsys/gromacs-462_clean/lib:/usr/local/gromacs/${_gromacs}/lib:" \
      -e "s:/home/vgapsys/Downloads/fftw/compiled/lib64:/usr/lib:" \
      -e "s:/home/vgapsys/Downloads/fftw/compiled/include:/usr/include:" \
      -i Makefile
  make
}

package() {
  source /usr/local/gromacs/${_gromacs}/bin/GMXRC
  msg2 "Installing g_lomepro"
  mkdir -p  ${pkgdir}/usr/local/gromacs/${_gromacs}/bin/
  cp  ${srcdir}/${pkgname}_v${pkgver}/g_lomepro_v${pkgver} ${pkgdir}/usr/local/gromacs/${_gromacs}/bin/
}

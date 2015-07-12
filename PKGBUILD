# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Kurnevsky Evgeny <kurnevsky@gmail.com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=scilab
pkgver=5.5.2
pkgrel=3
pkgdesc='A scientific software package for numerical computations.'
arch=('i686' 'x86_64')
url='http://www.scilab.org'
license=('BSD' 'custom:CeCILL')
depends=('shared-mime-info'  'desktop-file-utils' 'gtk-update-icon-cache'
         'suitesparse>=4.4.1'  'arpack' 'fftw'
         'libmatio' 'tk' 'curl'
         'java-runtime=7'
         'beanshell2' 'eclipse-ecj' 'java-flexdock>=1.2.4'   'fop-hyph'
         'java-freehep-vectorgraphics' 'jeuclid-core' 'jgraphx>=2.0.0.1' 'javahelp2'
         'saxon-he' 'jlatexmath-fop>=1.0.3' 'jrosetta>=1.0.4' 'jgoodies-looks' 'java-qdox'
         'scirenderer' 'java-skinlf' 'java-testng' 'xalan-java' 'docbook-xsl'
         'jogl2.2.4'
         'java-batik1.7' 'java-xmlgraphics-commons=1.5')
makedepends=('java-environment=7' 'apache-ant'
             'ocaml' 'gcc-fortran' )
conflicts=('scilab-git' 'scilab-bin')

source=("${url}/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('a734519de96d35b8f081768a5584086e46db089ab11c021744897b22ec4d0f5e')

install=${pkgname}.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --with-gcc \
    --with-gfortran \
    --with-mpi \
    --with-matio \
    --with-umfpack \
    --with-fftw \
    --with-modelica \
    --with-external-scirenderer=/usr/share/java/scirenderer/scirenderer.jar \
    --with-install-help-xml \
    --enable-build-help \
    --enable-build-localization \
    --disable-static-system-lib

  make all
  make doc
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-data install-html

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING-FR" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-FR"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING-BSD" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-BSD"
}

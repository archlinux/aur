# Maintainer: Clint Valentine <valentine.clint@gmail.com>
pkgname=qualimap
pkgver=2.2.1
pkgrel=1
pkgdesc="Evaluating next generation sequencing data"
arch=('i686' 'x86_64')
url="http://qualimap.bioinfo.cipf.es/"
license=('GPL2')
depends=('r>=3.1 java-runtime>=6 java-runtime-openjdk>=6')
provides=('qualimap')
conflicts=('qualimap')
install="${pkgname}".install
source=("https://bitbucket.org/kokonech/${pkgname}/downloads/${pkgname}_v${pkgver}.zip")
md5sums=('a13afe4325ec2f9a065f48a7f0880280')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/${pkgname}_v${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}_v${pkgver}/"

  cd "$srcdir/${pkgname}_v${pkgver}"

  ## Set qualimap home environmental default
  sed -i s#'QUALIMAP_HOME=.*'#'QUALIMAP_HOME=/usr/share/'"${pkgname}"'_v'"${pkgver}"# qualimap
  install -D -m 775 qualimap "${pkgdir}/usr/bin/qualimap"

  # Install license and history
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}_v${pkgver}/LICENSE"
  install -D -m644 HISTORY "${pkgdir}/usr/share/licenses/${pkgname}_v${pkgver}/HISTORY"

  # Copy .jar library dependencies and .R scripts
  cp -rf 'lib/'     "${pkgdir}/usr/share/${pkgname}_v${pkgver}/lib"
  cp -rf 'scripts/' "${pkgdir}/usr/share/${pkgname}_v${pkgver}/scripts"

  # Copy species data files
  cp -rf 'species/' "${pkgdir}/usr/share/${pkgname}_v${pkgver}/species"

  # Copy the main .jar class
  cp -f qualimap.jar "${pkgdir}/usr/share/${pkgname}_v${pkgver}/qualimap.jar"
}

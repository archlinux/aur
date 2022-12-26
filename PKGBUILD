# Contributor: Sauliusl <luksaulius[at]gmail[dot]com>
pkgname=beads
pkgver=1.1
pkgrel=2
pkgdesc="Bias Elimination Algorithm for Deep Sequencing."
url="http://beads.sourceforge.net/"
arch=('x86_64')
license=('unknown')
depends=('python2' 'java-environment')
source=("http://downloads.sourceforge.net/project/beads/BEADS-${pkgver}.tar.gz"
		"beads.sh")
sha1sums=('f83587d3b8c7b1eb619d81e17499e8f8fdae3138'
          'b30b472b1ff087eb3c015f00bd4619b346421cf5')
package() {
  cd "${srcdir}/BEADS-${pkgver}"
  python2 setup.py install --prefix=${pkgdir}/usr

  # Rename the python file to have .py extension
  mv ${pkgdir}/usr/bin/beads ${pkgdir}/usr/bin/beads.py
  # install script that presets the classpath beforehand in place of it
  install -Dm755 ${srcdir}/beads.sh ${pkgdir}/usr/bin/beads

  # Install the java classes
  install -d ${pkgdir}/usr/share/java/${pkgname}
  install -Dm0644 BEADSjava.jar ${pkgdir}/usr/share/java/${pkgname}
}

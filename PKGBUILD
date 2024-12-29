# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-bin
pkgver=4.1.2
pkgrel=1
pkgdesc="A complete and open application dedicated to backing tracks generation."
arch=('i686' 'x86_64' 'aarch64')
url="https://www.jjazzlab.org/"
license=('LGPL-2.1-or-later')
depends=('java-runtime=17' 'fluidsynth')
source=("https://github.com/jjazzboss/JJazzLab/releases/download/${pkgver}/JJazzLab-${pkgver}-linux-x64.tar.xz" "jjazzlab.desktop")
sha256sums=('ed413e3ce052b4446aa97a9469879bf8e984489cf83bc1f2e248f4c08673c51f'
            '0c11ad2c50439741a43629e551b9134e51b043c8c5250e1f47768dc9b443a034')

package() {
  cd "${srcdir}/JJazzLab-${pkgver}"

  # Let's use the system JDK instead of the bundled one
  rm -r jdk
  sed -i 's/^jdkhome="jdk"$/jdkhome="\/usr\/lib\/jvm\/java-17-openjdk\/"/' etc/jjazzlab.conf

  install -d "${pkgdir}/opt/jjazzlab"
  cp -rp * "${pkgdir}/opt/jjazzlab"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/jjazzlab/bin/jjazzlab ${pkgdir}/usr/bin/jjazzlab

  install -d "${pkgdir}/usr/share/applications"
  install ../jjazzlab.desktop "${pkgdir}/usr/share/applications"
}

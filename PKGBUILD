# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-bin
pkgver=5.2
_pkgsubver=a
pkgrel=1
pkgdesc="A complete and open application dedicated to backing tracks generation."
arch=('x86_64' 'aarch64')
url="https://www.jjazzlab.org/"
depends=('java-runtime=25' 'fluidsynth')
license=('LGPL-2.1-or-later')
source=("https://github.com/jjazzboss/JJazzLab/releases/download/${pkgver}/JJazzLab-${pkgver}${_pkgsubver}-linux-x64.tar.xz" "jjazzlab.desktop")
sha256sums=('377bfea20703d74ad3610733f3bb1e5699ba00e7e8c13bfcbf922512b1573fe5'
            '0c11ad2c50439741a43629e551b9134e51b043c8c5250e1f47768dc9b443a034')

package() {
  cd "${srcdir}/JJazzLab-${pkgver}"

  # Let's use the system JDK instead of the bundled one
  rm -r jdk
  sed -i 's/^jdkhome="jdk"$/jdkhome="\/usr\/lib\/jvm\/java-25-openjdk\/"/' etc/jjazzlab.conf

  install -d "${pkgdir}/opt/jjazzlab"
  cp -rp * "${pkgdir}/opt/jjazzlab"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/jjazzlab/bin/jjazzlab ${pkgdir}/usr/bin/jjazzlab

  install -d "${pkgdir}/usr/share/applications"
  install ../jjazzlab.desktop "${pkgdir}/usr/share/applications"
}

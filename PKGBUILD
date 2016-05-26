# Maintainer : Ainola
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=csound-blue
pkgver=2.5.14
pkgrel=3
pkgdesc="A music composition environment for Csound"
arch=(i686 x86_64)
url="http://blue.kunstmusik.com/"
license=('GPL')
depends=('csound' 'java-environment>=7')
makedepends=('pd' 'scons' 'swig' 'java-environment>=7' 'dssi' 'boost')
provides=('csound-blue')
conflicts=('csound-blue')
source=("https://downloads.sourceforge.net/project/bluemusic/blue/2.5.x/blue_${pkgver}.zip"
        "blue.desktop"
        "icons.tar.gz")
sha256sums=('f5af74275e4d6f7cc14230feb010d836691ef6576aee0c7f519c50121fcd04f0'
            '06dcc0dbade0b9c2eb904815aefa86d32e8e21de47fd7cd8873f139c1fb24fe6'
            '60240d02dd3f25b9df684efaf93a5fd05e520b5f46e94f24b58de60604dbae36')
options=(!strip)

package() {
  mkdir -p "$pkgdir"/opt/blue
  mkdir -p "$pkgdir"/usr/bin
  cp -r "$srcdir"/blue/* "$pkgdir"/opt/blue
  ln -s "/opt/blue/bin/blue" "$pkgdir/usr/bin/blue"

  install -D -m644 "${srcdir}/blue.desktop" "${pkgdir}/usr/share/applications/blue.desktop"
  for size in 16 22 24 32 48 64 128 256 512; do
      install -Dm644 "$srcdir/icons/${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/blue.png"
  done
}

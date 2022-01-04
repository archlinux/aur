# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=linux-show-player
pkgver=0.5.3
pkgrel=1
pkgdesc="Cue player designed for stage productions"
url="https://www.linux-show-player.org/"
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good' 'python-mido'
         'python-rtmidi' 'python-sortedcontainers' 'qt5-svg')
makedepends=('python-setuptools')
optdepends=('gst-libav: for larger format support'
            'ola: for Art-Net timecode support'
            'python-protobuf: for Art-Net timecode support'
            'portmidi: for portmidi support'
            'python-jack-client: for JACK output support')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FrancescoCeruti/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e5b70def979984053bae1023210f4c568f989f7714d712506911de6ea3837d0b')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 dist/linuxshowplayer.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 dist/linuxshowplayer.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 dist/linuxshowplayer.xml -t "${pkgdir}/usr/share/mime/packages"
}

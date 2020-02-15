# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=linux-show-player
pkgver=0.5.2
pkgrel=1
pkgdesc="Sound cue playback software designed for live musical shows and theatre plays"
url="http://linux-show-player.sourceforge.net/"
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good' 'python-mido'
         'python-sortedcontainers' 'qt5-svg')
makedepends=('python-setuptools')
optdepends=('gst-libav: for larger format support'
            'portmidi: for portmidi support'
            'python-jack-client: for JACK output support')
options=('!emptydirs')
source=("https://github.com/FrancescoCeruti/${pkgname}/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('b78689e5c8f5cdf1600fd8e58e30264e677ab0d8c77538aaaeb571f56185c9bb')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  sed -i -e 's|0\.5\.1|0.5.2|' lisp/__init__.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 dist/linuxshowplayer.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 dist/linuxshowplayer.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 dist/linuxshowplayer.xml -t "${pkgdir}/usr/share/mime/packages"
}

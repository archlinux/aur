# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tartube
pkgver=2.3.0
pkgrel=1
pkgdesc='A GUI front-end for youtube-dl, partly based on youtube-dl-gui and written in Python 3 / Gtk 3'
arch=('any')
url='https://github.com/axcore/tartube'
license=('GPL3')
depends=('gtk3'
         'python-requests'
         'python-pgi'
         'python-playsound'
         'python-feedparser')
optdepends=('ffmpeg: Video playback support'
            'python-moviepy'
            'atomicparsley')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axcore/tartube/archive/v${pkgver}.tar.gz")
sha256sums=('d2026391be1378bfa3b9e4aa004b67a1dcd433e9fc588ca310456466c05ba0f9')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "${pkgdir}/tartube/icons" "${pkgdir}/usr/lib/python3.8/site-packages/tartube/"
  rm -rvf "${pkgdir}/tartube/"
  install -d "${pkgdir}/usr/share/applications" \
   "${pkgdir}/usr/share/pixmaps"
  install -Dm644 pack/tartube.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et:

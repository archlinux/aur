# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tartube
pkgver=2.0.016
pkgrel=1
pkgdesc='A GUI front-end for youtube-dl, partly based on youtube-dl-gui and written in Python 3 / Gtk 3'
arch=('any')
url='https://github.com/axcore/tartube'
license=('GPL-3.0')
depends=('python'
         'gtk3'
         'ffmpeg'
         'python-moviepy'
         'atomicparsley')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axcore/tartube/archive/v${pkgver}.tar.gz")
sha256sums=('57fbc9f56ca0521afa58d3a7e7ef397b342e64a0e4b48ef1c0c7e65eaf916f2c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "${pkgdir}/tartube/icons" "${pkgdir}/usr/lib/python3.8/site-packages/tartube/"
  rm -rvf "${pkgdir}/tartube/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}" \
   "${pkgdir}/usr/share/applications" \
   "${pkgdir}/usr/share/pixmaps"
  ln -s /usr/share/licenses/common/GPL3/license.txt "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 pack/tartube.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et:
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tartube
pkgver=2.3.549
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
sha256sums=('cdabf38af4b88ef15162c61826f01cf394e32131644f6ab666505bd82f43ee24')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  _sitepkgs_dir="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  mv "${pkgdir}/tartube/icons" "${pkgdir}${_sitepkgs_dir}/tartube/"
  rm -rvf "${pkgdir}/tartube/"
  install -d "${pkgdir}/usr/share/applications" \
   "${pkgdir}/usr/share/pixmaps"
  install -Dm644 pack/tartube.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et:

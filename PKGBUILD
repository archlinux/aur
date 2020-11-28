# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clickmaster2000
pkgver=1.1
pkgrel=1
pkgdesc='A tally counter for images'
arch=('any')
url="https://www.thregr.org/~wavexx/software/clickmaster2000"
license=('GPL3')
depends=('python-pyqt5')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EuracBiomedicalResearch/clickmaster2000/archive/v${pkgver}.tar.gz"
        'icon.png')
sha256sums=('269a45bdad14270d0ac2223594c8c2d9c3a3054f2541522ff77f3248f94d9b40'
            '03255837baa6c38eedf5cc1f6c8cfe97800176804897b7c223215f9f997b20a7')

package() {
  cd "${pkgname}-${pkgver}"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "ClickMaster2000" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Science;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 clickmaster2000/clickmaster.html -t "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/clickmaster2000"
  install -Dm644 clickmaster2000/clickmaster.ui -t "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/clickmaster2000"
  install -Dm644 ../icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

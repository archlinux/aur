pkgname=jdreplace
pkgver=2.2
pkgrel=1
pkgdesc='With jdReplace you can replace a text in all files of a directory'
arch=('any')
url="https://gitlab.com/JakobDev/jdReplace"
license=('BSD')
depends=('python-pyqt5' 'python-jdtranslationhelper')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdReplace/-/archive/${pkgver}/jdReplace-${pkgver}.tar.gz")
sha256sums=('8a8df34b3dd4c80ac3561f109162fb3ef81008a50ebc3ce3915ef0a3139e16b5')

package() {
    cd "jdReplace-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "jdReplace" \
            --comment "$pkgdesc" \
            --exec jdReplace \
            --categories 'Qt;Utility'
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

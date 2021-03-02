# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdtextedit
pkgver=8.3
pkgrel=1
pkgdesc='An advanced text editor'
arch=('any')
url="https://gitlab.com/JakobDev/jdTextEdit"
license=('GPL3')
depends=('python-pyqt5'
         'python-qscintilla-qt5'
         'python-chardet'
         'python-requests'
         'python-cchardet'
         'python-editorconfig'
         'python-charset-normalizer'
         'python-jdtranslationhelper'
         'python-pyenchant'
         'python-setuptools')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdTextEdit/-/archive/${pkgver}/jdTextEdit-${pkgver}.tar.gz"
        'distribution.json')
sha256sums=('2eaf2a1f13105f6f450b010ee468694597bd409d6fa32dd578d7a21fde0ebb75'
            'c0f33924bce00130cd94a64e65b633f2d633482e648388e91159eac33b712c13')

package() {
  cd "jdTextEdit-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 jdTextEdit/Logo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${srcdir}/distribution.json -t "${pkgdir}/usr/lib/python3.9/site-packages/jdTextEdit/"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "jdTextEdit" \
          --comment "$pkgdesc" \
          --exec jdTextEdit \
          --categories 'TextEditor;Development;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

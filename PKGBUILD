# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jdtextedit
pkgver=7.2
pkgrel=1
pkgdesc='A powerful texteditor with a lot of features'
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
         'python-jdtranslationhelper')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdTextEdit/-/archive/${pkgver}/jdTextEdit-${pkgver}.tar.gz")
sha256sums=('9190b7dfe278326d9bbe3696999c2e53676b021391ffafc735b7fed88936cf22')

package() {
  cd "jdTextEdit-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 jdTextEdit/Logo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "jdTextEdit" \
            --comment "$pkgdesc" \
            --exec jdTextEdit \
            --categories 'TextEditor;Development;' \
            --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
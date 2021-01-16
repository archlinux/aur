# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jdtextedit
pkgver=8.0
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
         'python-jdtranslationhelper'
         'python-pyenchant')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdTextEdit/-/archive/${pkgver}/jdTextEdit-${pkgver}.tar.gz"
        'distribution.json')
sha256sums=('64f3e72e0f32ae16d72aebffe19de871bfd94f7bc93a8160190cd03934694d7d'
            'bdb7dd9ca97ac11bbba44e237cf99458e5343cc82f18ac112466ea9539f8477c')

package() {
  cd "jdTextEdit-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 jdTextEdit/Logo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length* ($2)-2)}')
  install -Dm644 ${srcdir}/distribution.json -t "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/jdTextEdit/"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "jdTextEdit" \
          --comment "$pkgdesc" \
          --exec jdTextEdit \
          --categories 'TextEditor;Development;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

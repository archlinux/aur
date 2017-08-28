# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=paperwork
pkgver=1.2.1
pkgrel=1
pkgdesc='A tool to make papers searchable - scan & forget'
arch=('any')
url='https://github.com/openpaperwork/paperwork'
license=('GPL3')
depends=('pygobject2-devel' 'pygtk' 'python-pycountry'
         'python-poppler-qt5' 'python-pyinsane2' 'python-pyocr'
         'python-levenshtein' 'python-whoosh' 'python-pyenchant'
         'python-joblib' 'python-numpy' 'python-scipy' 'python-scikit-learn'
         'python-scikit-image' 'python-gobject' 'python-nltk' 'python-termcolor'
         'python-simplebayes' 'python-pypillowfight' 'python-cairo'
         'gnome-icon-theme-symbolic' 'gnome-icon-theme' 'poppler-glib'
         'python-natsort' 'python-xdg' )
makedepends=('python' 'python-setuptools' 'git')
optdeps=('cuneiform: alternativer OCR')
source=("paperwork.desktop"
        "paperwork-gui-${pkgver}.tgz::https://github.com/openpaperwork/paperwork/archive/${pkgver}.tar.gz"
        "paperwork-backend-${pkgver}.tgz::https://github.com/openpaperwork/paperwork-backend/archive/${pkgver}.tar.gz")
md5sums=('4496dc70b2f159c7ea28160d2ebb60fe'
         '1ce63905208fed14f236927edcb5679a'
         'e6e04126b63731370bb8765943c5e2e3')
install=paperwork.install

build() {
  cd "${srcdir}/${pkgname}-backend-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-backend-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "data/${pkgname}_halo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=paperwork
pkgver=1.0.1
pkgrel=1
pkgdesc='A tool to make papers searchable - scan & forget'
arch=('any')
url='https://github.com/jflesch/paperwork'
license=('GPL3')
depends=('pygobject2-devel' 'pygtk' 'python-pycountry'
         'python-poppler-qt5' 'python-pyinsane2' 'python-pyocr'
         'python-levenshtein' 'python-whoosh' 'python-pyenchant'
         'python-joblib' 'python-numpy' 'python-scipy' 'python-scikit-learn'
         'python-scikit-image' 'python-gobject' 'python-nltk' 'python-termcolor'
         'python-simplebayes' 'python-pypillowfight' 'python-cairo'
         'glade' 'gnome-icon-theme-symbolic' 'gnome-icon-theme')
makedepends=('python' 'python-setuptools' 'git')
optdeps=('cuneiform: alternativer OCR')
source=("paperwork-gui.tgz::https://github.com/jflesch/paperwork/archive/${pkgver}.tar.gz"
        "paperwork-backend.tgz::https://github.com/jflesch/paperwork-backend/archive/${pkgver}.tar.gz")
md5sums=('fd8228928397af56577aa5c5bd93e518'
         '96f481afad471e2571e8d10b1d793ee5')
install=paperwork.install

build() {
  cd "${srcdir}/${pkgname}-backend-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-backend-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

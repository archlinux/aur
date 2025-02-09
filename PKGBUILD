# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=mathics3
pkgver=8.0.1
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner'
         'python-mpmath'
         'python-numpy'
         'python-palettable'
         'python-stopit'
         'python-pillow'
         'python-pint'
         'python-dateutil'
         'python-pympler'
         'python-requests'
         'python-scipy'
         'python-sympy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-packaging' 'cython')
#checkdepends=('python-pytest')
optdepends=( 'python-ipywidgets: For Manipulate'
             'python-llvmlite: Used for llvm compiling'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-psutil: SystemMemory and MemoryAvailable'
             'python-pyocr: Used for TextRecognize'
             'python-scikit-image>=0.17: FindMinimum can use this; used by Image as well'
             'python-unidecode: Used in Transliterate'
             'python-wordcloud>=1.9.3: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('4ce42e4bbb0aec61ab03ccd537f478dc2eabb953ab69073c07515a6e610c22fb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  PYTHONPATH="." pytest test
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

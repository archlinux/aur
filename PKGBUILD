# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=6.0.4
pkgrel=2
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-recordclass' 'python-pillow'
         'python-scikit-image')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=( 'python-ipywidgets: For Manipulate'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-psutil: SystemMemory and MemoryAvailable'
             'python-pyocr: Used for TextRecognize'
             'python-unidecode: Used in Transliterate'
             'python-wordcloud: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('b2d4e41008fb92c6ca00cfb345bbeca14b2ac1b447ae592254f48aba56e91d70')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/numpy<1.25/numpy>1.25/g' setup.py
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

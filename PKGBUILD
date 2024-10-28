# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=7.0.0
pkgrel=3
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-recordclass' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=( 'python-ipywidgets: For Manipulate'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-psutil: SystemMemory and MemoryAvailable'
             'python-pyocr: Used for TextRecognize'
             'python-scikit-image>=0.17: FindMinimum can use this; used by Image as well'
             'python-unidecode: Used in Transliterate'
             'python-wordcloud: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('d039a5dac244d7342abd29a5663d083ba28a86370f6b5cfddc6604ef42af150b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Temporarily lower required setuptools version until it gets updated
  sed -i 's/setuptools>=70.0.0/setuptools>=69.0.0/g' pyproject.toml
  sed -i 's/sympy>=1.11,<1.13/sympy>=1.11,<1.14/g' pyproject.toml
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

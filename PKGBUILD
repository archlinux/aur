# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=6.0.2
pkgrel=2
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-recordclass' 'python-pillow')
makedepends=('python-setuptools')
optdepends=( 'python-psutil: SystemMemory and MemoryAvailable'
             'python-scikit-image: FindMinimum can use this'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-wordcloud: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('e46858d4e3ef10f1fc7316fb337c8c7d25f9c785665d46bc09fc5d232a8d7664')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/numpy<1.25/numpy>1.25/g' setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=6.0.3
pkgrel=2
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-recordclass' 'python-pillow'
         'python-scikit-image')
makedepends=('python-setuptools')
optdepends=( 'python-psutil: SystemMemory and MemoryAvailable'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-wordcloud: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('331341e948e0cbcdae4042affa6c34f2d44d6fbd9f73fcb344f6578fc372d474')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/numpy<1.25/numpy>1.25/g' setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

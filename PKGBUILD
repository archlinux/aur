# Contributor: Sebastian Lau <lauseb644@gmail.com>

pkgname='python-omr'
_module='omr'
pkgdesc="Extract answer choices from scanned jpg bubble forms"
pkgver='0.0.73'
pkgrel=2
_url='http://github.com/GregoryCMiller/omr'
url='https://pypi.org/project/omr'
arch=('any')
license=('Custom')
depends=(
  'python-setuptools'
)
makedepends=()
source=(
  "https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
)
sha256sums=(
  '8feca62c1ceab22aeebe74533960f51d32813943195ba0f05dc73f1e3231374f'
)

prepare() {
  cd "$srcdir/$_module-$pkgver"
  2to3 -w */*.py
}

build() {
  cd "$srcdir/$_module-$pkgver"
  python setup.py build
}

package() {
  depends+=(
    'python-atomicwrites'
    'python-importlib-metadata'
    'python-opencv'
    'python-openpyxl'
    'python-pillow'
    'python-py'
    'python-pyparsing'
    'python-pytest'
    'python-six'
    'python-wcwidth'
    'python-yaml'
  )

  cd "$srcdir/$_module-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

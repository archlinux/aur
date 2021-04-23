# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.8.1
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
license=('Apache')
_py_deps=('cffsubr' # optdepends of ufo2ft required for [cffsubr]
          'fonttools>=4.22.0'
          'fs' # optdepends of fonttols required for [ufo]
          'lxml'
          'pillow'
          'regex'
          'toml'
          'ufo2ft'
          'ufolib2')
depends=('absl-py'
         'ninja'
         'picosvg>=0.15.1'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b0646daceb21878a86eb2f3dc41b1c4d7d0e3c681a43ece8543bcebca193f8d2')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

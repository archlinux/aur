# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.5.0
pkgrel=2
pkgdesc='A wee tool to build color fonts'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
license=('Apache')
_py_deps=('fonttools>=4.18.1'
          'fs' # optdepends of fonttols required for [ufo]
          'lxml'
          'pillow'
          'regex'
          'toml'
          'ufo2ft'
          'ufolib2')
depends=('absl-py'
         'ninja'
         'picosvg>=0.9.1'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('55ba0a51f5fe00bec6f0c92e655a69e865bc999f7ba89e07197def27456c47b3')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

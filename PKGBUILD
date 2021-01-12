# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.5.2
pkgrel=1
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
sha256sums=('11fec457ab90e5b9c4568821a714212ce743f16abe52b71dc229a898c1455b4b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

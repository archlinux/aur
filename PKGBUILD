# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.3.1
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
license=('Apache')
_py_deps=('fonttools>=4.13.0'
          'fs' # optdepends of fonttols required for [ufo]
          'lxml'
          'protobuf'
          'pygithub'
          'regex'
          'ufo2ft'
          'ufolib2')
depends=('absl-py'
         'picosvg>=0.6.1'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1bb72736f3b3c82a4ef82a2be02370c0b885430154646d88278b63c7065b75fe')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

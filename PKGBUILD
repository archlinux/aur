# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.3.3
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
sha256sums=('45a96e7f7d07ed45c15e48b11b6051b6b47503eac1f54f16ef7ded5eeed5d19b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

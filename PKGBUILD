# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.6.0
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
license=('Apache')
_py_deps=('fonttools>=4.20.0'
          'fs' # optdepends of fonttols required for [ufo]
          'lxml'
          'pillow'
          'regex'
          'toml'
          'ufo2ft'
          'ufolib2')
depends=('absl-py'
         'ninja'
         'picosvg>=0.11.1'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('83dc0309f52f15ed841e7a3682fc47f60c7f37275bf3db4de77a789250aed0ff')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

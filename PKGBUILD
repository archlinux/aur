# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

_pipname=panflute
pkgname=python-$_pipname
pkgver=2.1.0
pkgrel=1
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
url="https://github.com/sergiocorreia/$_pipname"
arch=('any')
license=('BSD')
_pydeps=('click'
         'yaml')
depends=('pandoc>=2.11.0.4' 'python' "${_pydeps[@]/#/python-}")
makedepends=('python-setuptools')
replaces=('pandoc-panflute')
_pycheckdeps=('pandocfilters'
              'pytest-cov')
checkdepends=("${_pycheckdeps[@]/#/python-}")
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/sergiocorreia/$_pipname/archive/$pkgver.tar.gz")
sha256sums=('f9b57046354b3372fa97446d295f843ff51b59887f619163dc0cdf164e45a606')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

check() {
    cd "$_pipname-$pkgver"
	python setup.py test
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

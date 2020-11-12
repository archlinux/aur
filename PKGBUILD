# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

_pipname=panflute
pkgname=python-$_pipname
pkgver=2.0.5
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
sha256sums=('2c2487bf90c4ef9bf5261a87a5336b58f357a152d6853b18167379568e310db5')

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

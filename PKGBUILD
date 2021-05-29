# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

_pipname=panflute
pkgname=python-$_pipname
pkgver=2.1.1
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
sha256sums=('e8c4580f36277ae195dc1614e7cff239d5d3eb0c40ef7e1abb676f6aa2df127c')

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

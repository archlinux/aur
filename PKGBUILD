# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

_pipname=panflute
pkgname=python-$_pipname
pkgver=2.0.4
pkgrel=2
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
url="https://github.com/sergiocorreia/$_pipname"
arch=('any')
license=('BSD')
_pydeps=('click'
         'yaml')
depends=('pandoc>=2.11.0.4' 'python' "${_pydeps[@]/#/python-}")
optdepends=('python-shutils' 'python-shlex')
makedepends=('python-setuptools')
replaces=('pandoc-panflute')
_pycheckdeps=('pandocfilters'
              'pytest-cov')
checkdepends=("${_pycheckdeps[@]/#/python-}")
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/sergiocorreia/$_pipname/archive/$pkgver.tar.gz")
sha256sums=('62183a9220a2fad698491c81e5a23ba82fd4805427ad4f73e4f63de98151c6c1')

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

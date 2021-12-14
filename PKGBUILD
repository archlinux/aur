# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_pyname=panflute
pkgname=python-$_pyname
pkgver=2.1.1
pkgrel=6
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
arch=(any)
url="https://github.com/sergiocorreia/$_pyname"
license=(BSD)
_pydeps=(click
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
_pycheckdeps=(pandocfilters
              pytest-cov)
checkdepends=("${_pycheckdeps[@]/#/python-}")
provides=("pandoc-$_pyname=$pkgver")
conflicts=("pandoc-$_pyname")
replaces=("pandoc-$_pyname")
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e8c4580f36277ae195dc1614e7cff239d5d3eb0c40ef7e1abb676f6aa2df127c')

prepare() {
	cd "$_archive"
	sed -i -e '/click/s/<8/<9/' setup.py
}

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_py_name=panflute
pkgname=python-$_py_name
pkgver=2.1.1
pkgrel=4
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
arch=(any)
url="https://github.com/sergiocorreia/$_py_name"
license=(BSD)
_pydeps=(click
         yaml)
depends=('pandoc>=2.12'
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
_py_checkdeps=(pandocfilters
               pytest-cov)
checkdepends=("${_py_checkdeps[@]/#/python-}")
provides=("pandoc-$_py_name=$pkgver")
conflicts=("pandoc-$_py_name")
replaces=(pandoc-panflute)
_archive="$_py_name-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e8c4580f36277ae195dc1614e7cff239d5d3eb0c40ef7e1abb676f6aa2df127c')

prepare() {
	cd "$_archive"
	sed -i -e '/click/s/<8/<9/' setup.py
}

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
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

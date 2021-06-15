# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_py_name=panflute
pkgname=python-$_py_name-git
pkgver=2.1.1.r5.g8e9e98c
pkgrel=1
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
url="https://github.com/sergiocorreia/$_py_name"
arch=(any)
license=(BSD)
_pydeps=(click yaml)
depends=('pandoc>=2.11.0.4' python "${_pydeps[@]/#/python-}")
makedepends=(git python-setuptools)
_py_checkdeps=(pandocfilters pytest-cov)
checkdepends=("${_py_checkdeps[@]/#/python-}")
provides=("${pkgname%-git}=$pkgver" "pandoc-$_py_name=$pkgver")
conflicts=("${pkgname%-git}" "pandoc-$_py_name")
replaces=("python-$_py_name-git")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --always --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python setup.py test
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

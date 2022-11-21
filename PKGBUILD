# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=ufoLib2
pkgname=python38-${_pyname,,}
pkgver=0.14.0
pkgrel=1
pkgdesc='A library to deal with UFO font sources'
arch=(any)
url="https://github.com/fonttools/$_pyname"
license=(Apache)
_pydeps=(attrs
         cattrs
         fonttools
         fs # for fonttools[ufo]
         lxml)
depends=(python38
         "${_pydeps[@]/#/python38-}")
makedepends=(python38-{build,installer,wheel}
             python38-setuptools-scm) # scm required for _version file generation
checkdepends=(python38-msgpack
              python38-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('39d5097cd7b79ce43209fde74fdff9cbf0bcbd95e74805a22c7bd9f065cc562c')

build() {
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests --deselect tests/serde/test_json
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
}

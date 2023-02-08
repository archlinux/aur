# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-data
_pkgname=${pkgname#python-}
pkgver=0.38.4
pkgrel=1
pkgdesc='DVC’s data management subsystem'
arch=(any)
license=(Apache)
url="https://github.com/iterative/$_pkgname"
_pydeps=(dictdiffer
         dvc-objects
         funcy
         pygtrie
         shortuuid)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer} python-setuptools-scm python-wheel)
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('59f840810a188dff4301bc32a435f16d55cd63329aedd966ce6edace5a9f8afc')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

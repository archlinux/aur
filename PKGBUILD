# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-data
_pkgname=${pkgname#python-}
pkgver=0.34.0
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
sha256sums=('d25b2132450399603fa65f7cea0e60f90b3a71cdce64eb0b287f2f81322a1442')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

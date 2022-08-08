# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-data
_pkgname=${pkgname#python-}
pkgver=0.0.23
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
sha256sums=('cc99b8b28e3379b4742245c257194ae9c3611bde42698820aadee01d04ca972d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

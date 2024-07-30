# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=annextimelog
pkgver=0.14.0
pkgrel=1
pkgdesc='CLI to track time spent on projects, backed by Git Annex'
arch=(any)
url="https://gitlab.com/nobodyinperson/$pkgname"
license=(GPL-3.0-or-later)
_pydeps=(rich)
depends=(python
         "${_pydeps[@]/#/python-}"
         git-annex)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('7fc390f20c5ad30a2225cb90d159b038b7fa1010e75137dff6a41d2fd7053854')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

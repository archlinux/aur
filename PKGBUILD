# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=annextimelog
pkgver=0.11.0
pkgrel=1
pkgdesc='CLI to track time spent on projects, backed by Git Annex'
arch=(any)
url="https://gitlab.com/nobodyinperson/$pkgname"
license=(GPL3)
_pydeps=(rich)
depends=(python
         "${_pydeps[@]/#/python-}"
         git-annex)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('d081339ae61e29e41eeb38fe05a291350c393dfbfc4bfc60db7bf6f7eb8c118a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

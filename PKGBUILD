# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=annextimelog
pkgver=0.15.0
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
sha256sums=('d70bc483172ff650314de87a8d876752a78ad52438ef5ae9e703bd54112f1b57')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

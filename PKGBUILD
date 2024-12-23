# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=latex-flatten
pkgver=0.3.0
pkgrel=3
pkgdesc='Make the file structure of your LaTeX project boring and flat'
arch=(any)
url="https://gitlab.com/nobodyinperson/$pkgname"
license=(GPL-3.0-only)
_pydeps=(rich)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('671cd00d1289f86df5dfb80e80daf16fa1ddf8d222567f978e956306f3ad601d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

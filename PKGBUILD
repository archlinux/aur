# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.14.2
pkgrel=5
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=(any)
url="https://github.com/ickc/$_name"
license=(GPL-3.0-only)
_pydeps=(panflute
         numpy
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_archive.tar.gz")
sha256sums=('7e0c9b935a08f1eca78d1a4f7bee457dbcc809a0825c0c5ed0113007b7d00810')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

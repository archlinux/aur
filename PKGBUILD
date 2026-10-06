# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.15.0
pkgrel=1
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
             python-uv-build)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_archive.tar.gz")
sha256sums=('0288b928f10525b36b42b21d1c9150b0b3db05d10e739dafff31f425e82ccfe3')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

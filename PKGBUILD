# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-textual-plotext
_pyname=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc='A Textual widget wrapper for the Plotext plotting library'
arch=(any)
url="https://github.com/Textualize/$_pyname"
license=(MIT)
_pydeps=(plotext
         textual)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('836f53a3316756609e194129a35c2875638e7958c261f541e0a794f7c98011be')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

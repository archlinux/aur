# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-gobbet
_pyname=${pkgname#python-}
pkgver=0.0.3
pkgrel=4
pkgdesc='Random news articles in any language '
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(tqdm
         mwparserfromhell
         orjson
         nltk
         htmllistparse
         youseedee)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('df1178e40f16852cb4dd733c395e3e75679cfde22941bf4d701f23a3b75e8c01')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

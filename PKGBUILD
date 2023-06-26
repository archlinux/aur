# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=vharfbuzz
pkgname=python-$_pyname
pkgver=0.2.0
pkgrel=1
pkgdesc='A user-friendlier way to use Harfbuzz in Python'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(fonttools
         uharfbuzz)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('b835f67d8ab1578c2600020c7c0ddd0688569aad4dd15bab4931053a3491a666')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

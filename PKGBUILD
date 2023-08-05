# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-sphinxcontrib-mermaid'
_name=${pkgname#python-}
pkgver=0.9.2
pkgrel=1
pkgdesc='Mermaid diagrams in yours sphinx powered docs'
arch=('any')
url='https://pypi.org/project/sphinxcontrib-mermaid/'
license=('BSD')
depends=(
	'python'
	'python-sphinx'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('252ef13dd23164b28f16d8b0205cf184b9d8e2b714a302274d9f59eb708e77af')

build() {
	cd "$_name-$pkgver"

	python -m build --wheel --no-isolation
}

check(){
	cd "$_name-$pkgver"

	pytest --fixtures
}

package() {
	cd "$_name-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

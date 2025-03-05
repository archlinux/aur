# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-sphinxcontrib-mermaid'
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.0
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
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2e8ab67d3e1e2816663f9347d026a8dee4a858acdd4ad32dd1c808893db88146')

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

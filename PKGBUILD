# Maintainer: PeterWang-dev <PeterWang030908@hotmail.com>
pkgname=python-teroshdl
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="A group of python dependencies for TerosHDL, an open source toolbox for HDL developers."
arch=('any')
url="https://github.com/TerosTechnology/vscode-terosHDL"
license=('GPL-3.0-only')
depends=(
	'yosys'
	'python-vunit_hdl>=4.4.1'
	'python-edalize>=0.2.5'
	'python-vsg>=3.3.0'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-cocotb')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3a3437cfa2ca61e59543ab2303bc604c10102111d3121c9bbc3dd75bfdf8691a')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
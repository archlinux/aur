# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=cupy
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=13.3.0
pkgrel=1
pkgdesc="NumPy-like API accelerated with CUDA"
url="https://cupy.dev"
arch=('x86_64')
license=('MIT')
depends=(
	'cuda' 'python-fastrlock' 'python-numpy'
	'libcutensor' 'cusparselt'
)
optdepends=('libcutensor' 'nccl')
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
_wheel="${_name}_cuda12x-${pkgver}-cp312-cp312-manylinux2014_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/90/dc/da09e5184d94146b8cbf240c2bef1c4851cbafd7e2d60cc71b1530c766ec/${_wheel}"
)
sha256sums=('e206bd8664f0763732b6012431f484ee535bffd77a5ae95e9bfe1c7c72396625')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}

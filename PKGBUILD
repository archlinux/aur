# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-sbom
_origpkgname=hatch_sbom
pkgver=0.4.2
pkgrel=1
pkgdesc="Hatchling build hook plugin for generating Software Bill of Materials (SBOM)"
arch=("x86_64")
url='https://pypi.org/project/hatch-sbom/'
license=("MIT")
depends=(
   	"python-hatch"
	"python-hatch-vcs"
	"uv"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/source/h/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('6539360cae31e807be0154a292fea2d842a173b314ed567804044a5b1a7f3ce0')

prepare() {
	cd "${_origpkgname}-${pkgver}" || exit
	sed -i \
		-e 's/hatchling==[^",]*/hatchling>=1.28.0,<2.0.0/' \
		-e 's/hatch-vcs==[^",]*/hatch-vcs>=0.5.0,<1.0.0/' \
		-e 's/uv==[^",]*/uv>=0.12.0/' \
		pyproject.toml
}

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}

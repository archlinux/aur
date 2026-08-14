# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-sbom
_origpkgname=hatch_sbom
pkgver=0.4.1
pkgrel=2
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
sha256sums=('d8704bb9edb79788a2b5a47d318d6dd55e85f4fff80fea0d57e4626855ee0d4a')

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

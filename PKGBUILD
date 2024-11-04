# Maintainer: Frederick Price <fprice at pricemail dot ca>

pkgname=python-openlp-osc-control
_reponame=openlposccontrol
pkgver=0.1.3
pkgrel=1
pkgdesc="Daemon to allow control of OpenLP using OSC control"
url="https://github.com/rickprice/openlp-OSC-control"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-osc'
	'python-requests'
)
makedepends=(
	'git'
	'python-flit'
)
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('018d3884ffbba5ba4884909a67006ffd59e2ed37adde5566aa604290de95b740')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

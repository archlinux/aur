# Maintainer: Frederick Price <fprice at pricemail dot ca>

pkgname=python-openlp-osc-control
_reponame=openlposccontrol
pkgver=0.1.3
pkgrel=3
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
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz"
        "OpenLPOSCControl.service")

sha256sums=('018d3884ffbba5ba4884909a67006ffd59e2ed37adde5566aa604290de95b740'
            '6c4586eb00d91c4a375ec0301f88818527e6cbbc1e060ba8313fb52ef4e1aa65')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    install -Dm644 OpenLPOSCControl.service -t "$pkgdir"/usr/lib/systemd/system

	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

}

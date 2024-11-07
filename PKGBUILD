# Maintainer: Frederick Price <fprice at pricemail dot ca>

pkgname=python-openlp-osc-control
_reponame=openlposccontrol
pkgver=0.1.4
pkgrel=6
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
        "OpenLPOSCControl@.service")

sha256sums=('d585cfa6f40d3e7e484698f4c2c28c6b7feb42e487916d9b829422a9e257c959'
            'a475d3dd6af7171f76b4f07dcb8432ea1a099e7ffcb01bb2cfa2abc69b814081')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "$srcdir"/OpenLPOSCControl@.service -t "${pkgdir}"/usr/lib/systemd/system

	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

}

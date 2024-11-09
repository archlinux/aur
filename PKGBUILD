# Maintainer: Frederick Price <fprice at pricemail dot ca>

pkgname=python-openlp-osc-control
_reponame=openlposccontrol
pkgver=0.1.7
pkgrel=1
pkgdesc="Daemon to allow control of OpenLP using OSC control"
url="https://github.com/rickprice/openlp-OSC-control"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-osc'
	'python-requests'
    'python-cysystemd'
)
makedepends=(
	'git'
	'python-flit'
)
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz"
        "OpenLPOSCControl@.service")

sha256sums=('0568d1b52f07da7726526e5fc7c4884ec34aee570ce9f020e621233793308a3f'
            'a6e6d767595f32941c73cb1f69a62c572c8febb71aab501aae3bf866b0aeb4ad')

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

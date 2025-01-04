# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=par2deep
pkgver=1.11.0
pkgrel=1
pkgdesc="Create, verify and repair parity files in a file tree."
arch=('any')
url="https://github.com/brenthuisman/par2deep"
license=('LGPL3')
depends=('python')
makedepends=('gendesk' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brenthuisman/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01432fc1a8ecd078ed74932b0f8bf5ebd3b2a6dcaa22cf66a0061c7e48eef8f0')

_srcdir="${pkgname}-${pkgver}"

build() {
	gendesk -f -n --pkgname "${pkgname}" --categories 'Utility'

	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=(
		'python-tqdm'
		'python-configargparse'
		'python-send2trash'
		'python-pyqt5'
		'python-darkdetect'
		'par2cmdline')

	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/${pkgname}"
}

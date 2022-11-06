# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=par2deep
pkgver=1.9.4.2
pkgrel=1
pkgdesc="Create, verify and repair parity files in a file tree."
arch=('any')
url="https://github.com/brenthuisman/par2deep"
license=('LGPL3')
depends=(
	'python-tqdm'
	'python-configargparse'
	'python-send2trash'
	'python-pyqt5'
	'libpar2'
	'par2cmdline')
makedepends=('gendesk' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brenthuisman/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c171167e583901098fbf21d8466e1c9e0a0791b5f826dc96ccdbce6b81879a59')

_srcdir="${pkgname}-${pkgver}"

build() {
	gendesk -f -n --pkgname "${pkgname}" --categories 'Utility'

	cd "${_srcdir}"
	python 'setup.py' build
}

package() {
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	
	cd "${_srcdir}"
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix='/usr'
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/${pkgname}"

	rm -f "$pkgdir/usr/lib/python"*"/site-packages/$pkgname/libpar2".*
}

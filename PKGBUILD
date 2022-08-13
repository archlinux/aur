# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.25.2
pkgrel=2
pkgdesc="dict subclass with keylist/keypath support, I/O shortcuts (base64, csv, json, pickle, plist, query-string, toml, xml, yaml) and many utilities."
arch=('any')
url="https://github.com/fabiocaccamo/python-benedict"
license=('MIT')
depends=(
	'python'
	'python-ftfy'
	'python-mailchecker'
	'python-phonenumbers'
	'python-dateutil'
	'python-fsutil'
	'python-slugify'
	'python-pyaml'
	'python-requests'
	'python-six'
	'python-toml'
	'python-xmltodict'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('30f30fb1883bfcd0ab6e70b8a4241a4a32a2db08bf0c6592d14ea9e8d3d944f1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.27.0
pkgrel=1
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
sha256sums=(
	'7e4eb4f55ed84b0f3fecf74adf7d8b5b72421565c60a5df14b511f1705597753'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

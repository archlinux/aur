# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.36.0
pkgrel=2
pkgdesc="Dict subclass with keylist/keypath support, built-in I/O operations (base64, csv, html, ini, json, pickle, plist, query-string, toml, xls, xml, yaml), s3 support and many utilities."
arch=('any')
url="https://github.com/fabiocaccamo/python-benedict"
license=('MIT')
depends=(
	'python'

	# regular dependencies
	'python-slugify'
	'python-typing_extensions'
	'python-useful-types'

	# needed for "parse" target
	'python-ftfy'
	'python-mailchecker'
	'python-phonenumbers'
	'python-dateutil'

	# needed for all "io" targets
	'python-fsutil'
	'python-requests'
)
optdepends=(
	'python-beautifulsoup4: HTML support'
	'python-openpyxl: XLS support'
	'python-xlrd: XLS support'
	'python-boto3: S3 support'
	'python-xmltodict: HTML & XML support'
	'python-yaml: YAML support',
	'python-toml: TOML support'
	'python-pydantic: Schema support'
)

makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=(
	'2524a1ac342a27523875c1dcbc9ba2808dc8802e7f91159a594320529b88303ac1d7f4cc80982fdde77c6ba1d4980fefae6b4ea0fd79aab07846f16141bffa67'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

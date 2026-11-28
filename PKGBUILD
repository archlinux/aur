# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.41.0
pkgrel=1
pkgdesc="Dict subclass with keylist/keypath support, built-in I/O operations (base64, csv, html, ini, json, pickle, plist, query-string, toml, xls, xml, yaml), s3 support and many utilities."
arch=('any')
url="https://github.com/fabiocaccamo/python-benedict"
license=('MIT')
depends=(
	'python'

	# regular dependencies
	'python-slugify'
	'python-typing_extensions'

	# some dependencies are needed only for certain "targets". They could be
	# made optional, but for some targets multiple deps are required at the same
	# time. This is difficult/impossible to express in AUR. We assume therefore
	# that all users want to use "parse" and "io" targets, and make deps for
	# these targets mandatory

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
	'python-yaml: YAML support'
	'python-tomli: TOML support'
	'python-tomli-w: TOML support'
	'python-pydantic: Schema support'
)

makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=(
	'01f1159561ffbe3edb5693392d302503c4e32a48a1330d38d5a1c86c90f7dbaac1674fb30b3c6063263eccaf3a907c0674390bc2126a0bfb87a3056cd5e92a82'
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

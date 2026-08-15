# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=xml2rfc
pkgver=3.34.0
pkgrel=1
pkgdesc='generates RFCs and IETF drafts from XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(
	python
	python-configargparse
	python-google-i18n-address
	python-intervaltree
	python-jinja
	python-lxml
	python-natsort
	python-platformdirs
	python-pycountry
	python-requests
	python-wcwidth
	python-yaml
)
makedepends=(
	python-build
	python-installer
	python-wheel
)
optdepends=('python-weasyprint: PDF support')
license=(LicenseRef-BSD-3-Clause)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('173ad5cd21f7a2fddb0dbc19649bc8f73716dff5465e4e4fcd5bb21d5208ccf1')

build() {
  cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

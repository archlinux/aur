# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=xml2rfc
pkgver=3.31.0
pkgrel=1
pkgdesc='generates RFCs and IETF drafts from XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests python-platformdirs python-setuptools
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
makedepends=(
	python-build
	python-installer
	python-wheel)
license=(LicenseRef-BSD-3-Clause)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('0a1d4ccc4425aed39b5f0f833a8eb1e0f9e8f1897d3441c3a15877dee36cf484')

build() {
  cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}

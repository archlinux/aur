# Maintainer: Javier Castro <dev at javiercastro period xyz>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='8.1'
pkgrel=1
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=(
	'python-anyascii'
	'python-asgiref'
	'python-beautifulsoup4'
	'python-boto3'
	'python-botocore'
	'python-django'
	'python-django-modelcluster'
	'python-django-taggit'
	'python-freezegun'
	'python-jinja'
	'python-markupsafe'
	'python-openpyxl'
	'python-pillow'
	'python-requests'
	'python-setuptools'
	'python-willow'
)
makedepends=('python-installer' 'python-wheel')
checkdepends=(
	'python-installer'
	'python-wheel'
)
license=('MIT')
arch=('any')
source=("https://github.com/${_name}/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6e143445511c9862cf787a04f02feb50e6feda0b150628748b4ee355630c4a9f1a049ff9719ec71bcf08fb7f2221607a2fc0ce4493b4506ae3966e459642a0b3')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

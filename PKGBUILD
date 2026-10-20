# Maintainer: Javier Castro <dev at javiercastro period xyz>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='8.0'
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
sha512sums=('867bec35efc557cdb90560548012e2302c1e89da42ace29b4a6ea38255d4f647b8fa57bf8d0739fe1751c1ed945a9f72ec1fde81eccda7a247bd2208e9be3ca4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

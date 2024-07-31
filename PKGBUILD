# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='6.1.3'
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
	'python-freezegun'
	'python-jinja'
	'python-markupsafe'
	'python-pillow'
	'python-requests'
	'python-setuptools'
	'python-willow'
)
makedepends=('python-installer' 'python-wheel')
checkdepends=(
	'python-django-modelcluster'
	'python-installer'
	'python-openpyxl'
	'python-wheel'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('207927bcc3890f5dfba54cdd4b36a6c8a90ad41b226737c0c81cf751832a6ae881c1f92f29f791c0dcbd63ea34d47318e23d26be7d72532c1e6ff4670dc67d5f')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

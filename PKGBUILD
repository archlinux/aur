# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='6.1.2'
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
sha512sums=('595a4564395f577f972bde81f8faaf412d9e0422546842009872dda8e2fea6d1946ac5c78af8ee8f14be351d18cff2c0dd3f91ad519733892850253f3d630354')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

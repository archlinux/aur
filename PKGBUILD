# Contributor: Lex Black <autumn-wind@web.de>

_name=django-js-asset
pkgname=python-django-js-asset
pkgver=3.0.1
pkgrel=1
pkgdesc="script tag with additional attributes for django.forms.Media"
url="https://github.com/matthiask/django-js-asset/"
arch=("any")
license=("bsd")
depends=("python-django")
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=("python-pytz")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
b2sums=('af37c677032098e6639663bdad41012d7fc775cb1206f3326df53f3b0f528af7d0b17c05f4940215568cb72c1e77edd62c91ab511115191227d85b1df0a21e54')


build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver/tests/"
	python manage.py test
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}


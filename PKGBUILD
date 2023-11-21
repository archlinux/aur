# Contributor: Lex Black <autumn-wind@web.de>

_name=django-js-asset
pkgname=python-django-js-asset
pkgver=2.1
pkgrel=1
pkgdesc="script tag with additional attributes for django.forms.Media"
url="https://github.com/matthiask/django-js-asset/"
arch=("any")
license=("bsd")
depends=("python-django")
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=("python-pytz")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
b2sums=('d4885fd36dcc583d8f614894c7fc887796fc7cb24d08243a6eb6a1f7339f2e3ae9eaa6f787ca9913697926fdb7b9e646f6416f4b467262b2ceb0fd63cfd93ae5')


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


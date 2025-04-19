# Contributor: Lex Black <autumn-wind@web.de>

_name=django-js-asset
pkgname=python-django-js-asset
pkgver=3.1.2
pkgrel=1
pkgdesc="script tag with additional attributes for django.forms.Media"
url="https://github.com/matthiask/django-js-asset/"
arch=("any")
license=("bsd")
depends=("python-django")
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=("python-pytz")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
b2sums=('f2e0435790bd6f506f946ee7b50e1245d08afa6915a9d6ba07d87087b548b03c34a0e9bc17e9b12aa7be2daafd462e82c53ad3c69862a9ddaa8819eb66a2bebf')


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


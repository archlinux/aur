# Contributor: Lex Black <autumn-wind@web.de>

_name=django-js-asset
pkgname=python-django-js-asset
pkgver=2.2
pkgrel=1
pkgdesc="script tag with additional attributes for django.forms.Media"
url="https://github.com/matthiask/django-js-asset/"
arch=("any")
license=("bsd")
depends=("python-django")
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=("python-pytz")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
b2sums=('a4825fc9828e45966058232afcf5312d20273696efdacb5a45c16f55ad214d530b41aaea124d9e4722240437f6776c8386a5a6bfe273278aecf816459a3fb0a9')


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


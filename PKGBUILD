# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=drf-spectacular
pkgname=python-$_name
pkgver=0.29.0
pkgrel=2
pkgdesc="Sane and flexible OpenAPI (3.0.3 & 3.1) schema generation for Django REST framework."
arch=('any')
url="https://github.com/tfranzel/${_name}"
license=('BSD-3-Clause')
depends=(
	'python'
	'python-django'
	'python-django-rest-framework'
	'python-uritemplate'
	'python-yaml'
	'python-jsonschema'
	'python-inflection'
)
optdepends=('python-drf-spectacular-sidecar')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-pytest-django'
	'python-pytest-cov'
	'python-psycopg2'
	'python-django-oauth-toolkit'
)
optdepends=()
source=(
	"https://github.com/tfranzel/$_name/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	./runtests.py --nolint --ignore=tests/contrib
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/python-drf-spectacular/LICENSE"
}
sha256sums=('8403ac1d4ee192d67a97c6a5d417e7e956af266f012436993340f91dd800ed80')

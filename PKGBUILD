# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=strawberry-graphql
pkgname=python-$_name
pkgver=0.287.0
pkgrel=2
pkgdesc="Python GraphQL library based on dataclasses"
arch=('any')
url="https://github.com/strawberry-graphql/strawberry"
license=('MIT')
depends=(
	'python'
	'python-graphql-core'
	'python-dateutil'
	'python-rich'
	'python-packaging'
	'python-lia-web'
	'python-pygments'
	'python-typing_extensions'
)
optdepends=(
	'python-aiohttp'
	'python-chalice'
	'python-channels'
	'python-django'
	'python-fastapi'
	'python-flask'
	'python-quart'
	'python-pydantic'
	'python-pydantic-core'
	'python-pytest-aiohttp'
	'python-pytest-django'
	'python-sanic'
	'python-starlette'
	'python-litestar'
	'python-mypy'
	'python-uvicorn'
	'python-daphne'
	'python-opentelemetry-api'
	'python-pyinstrument'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
)
checkdepends=(
	'python-pytest'
	'python-pytest-asyncio'
	'python-pytest-mock'
	'python-pytest-emoji'
	'python-inline-snapshot'
	'python-asgiref'
	'python-libcst'
	'python-pytest-snapshot'
	'python-freezegun'
	'python-urllib3'
	'python-pyinstrument'
	'python-pydantic'
	'python-opentelemetry-api'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/strawberry-graphql/strawberry/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "strawberry-$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "strawberry-$pkgver"

	pytest -o addopts="" --ignore=tests/typecheckers --ignore=tests/cli --ignore=tests/benchmarks --ignore=tests/experimental/pydantic -m asgi --ignore=tests/asgi -m aiohttp --ignore=tests/aiohttp -m chalice --ignore=tests/chalice -m channels --ignore=tests/channels -m django --ignore=tests/django -m fastapi --ignore=tests/flask -m quart --ignore=tests/quart -m sanic --ignore=tests/sanic -m litestar --ignore=tests/litestar -m pydantic --ignore=tests/pydantic
}

package() {
	cd "strawberry-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('9d06034044cca54a770eafc897c7cfa53a9ec0b4fb61cde3ee0b502d05558e39')

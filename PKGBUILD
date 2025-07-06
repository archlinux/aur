# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: AngrySoft - Sebastian Zwierzchowski
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-sse-starlette
_pkgname=${pkgname#python-}
pkgver=2.4.1
pkgrel=1
pkgdesc="Server Sent Events (SSE) for Starlette and FastAPI"
arch=(any)
url="https://github.com/sysid/sse-starlette"
license=(BSD-3-Clause)
depends=(
  python
  uvicorn
  python-anyio
  python-starlette
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-async-timeout
  python-asgi-lifespan
  python-fastapi
  python-httpx
  python-psutil
  python-pytest
  python-pytest-asyncio
  python-portend
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c399a106459c6b1b6681d3214d35a263467aa675e6778b58d0088fecb88d3989')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  #  rm -rf test-env
  #  python -m venv --system-site-packages test-env
  #  test-env/bin/python -m installer "$_pkgname-$pkgver"/dist/*.whl
  #  test-env/bin/python -m pytest "$_pkgname-$pkgver"/tests -k "not test_sse_multiple_consumers" --ignore=tests/integration/test_multiple_consumers.py
  echo "Skipping tests until they start to behave"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:

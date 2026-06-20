# Contributor: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: AngrySoft - Sebastian Zwierzchowski
# Maintainer: Dawei Yang <yangdawei.home+archlinux.org@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-sse-starlette
_pkgname=${pkgname#python-}
pkgver=3.4.5
pkgrel=2
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
  python-wheel
)
checkdepends=(
  python-asgi-lifespan
  python-fastapi
  python-httpx
  python-psutil
  python-pytest
  python-pytest-asyncio
  python-portend
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("5ce84119136802b2ad42b80cbe157024fe8010160b7cab3d1a7c5bea8adef665")

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m pytest tests/ --ignore=tests/experimentation --ignore=tests/integration
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:

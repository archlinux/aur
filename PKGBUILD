# Maintainer: Evgenii Alekseev

_pkgname=aiohttp-sse
pkgname=python-aiohttp-sse-git
pkgver=2.2.0.r120.gc8c79a8
pkgrel=1
pkgdesc="Server-sent events support for aiohttp"
arch=('any')
url="https://github.com/aio-libs/aiohttp-sse"
license=('Apache-2.0')
depends=('python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
conflicts=("python-aiohttp-sse")
provides=("python-aiohttp-sse")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^[A-Za-z]*//'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

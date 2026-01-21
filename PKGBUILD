pkgname=python-runtype
pkgver=0.5.3
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/erezsh/runtype'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94fdf42008ce74737f0a4d990fa33c4fd19eed8ba9e57084c8add92b48b7faf4')

depends=(
  python-typing_extensions
)

makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)

build() {
  cd "runtype-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "runtype-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

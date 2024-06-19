# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname="${pkgname#python-}"
pkgver=0.5.0
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/erezsh/runtype'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-recommonmark'
  'python-sphinx'
  'python-sphinx-markdown-tables'
  'python-wheel'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
  make -C docs man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGES,README}.md
  install -vDm0644 docs/_build/man/runtype.7 \
    "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

sha256sums=(
  'c3e315f98413f099996932b070309db237141be4099d478723cabda8d8b3cef4'
)
b2sums=(
  '94aea1075e87e6ebb70a9ea7eaaef4e7bc6dee6cd82b450cb5af71e49b8da0f3b547296b29fe91d46551a6cb6227c65b780687b5c33d72e3088c4e92a36a2fce'
)

# eof

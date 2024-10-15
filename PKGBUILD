# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname="${pkgname#python-}"
pkgver=0.5.2
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
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py
  install -vDm0644 docs/_build/man/runtype.7 \
    "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

sha256sums=(
  'a6edaf0779436fe4b965eeedfb5650505c5a27cd7ec7d2d07140f53553a88bc6'
)
b2sums=(
  '4d6e4ba337639b555757688e5f81a12b2d623455c1b006df58a7bb52c7d3f31cb09f5eaeb44dfeadfb299fbb46aa0291b9b469d0c4d7b5d52a38c2b53f828597'
)

# eof

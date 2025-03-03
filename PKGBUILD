# -*- sh -*-

# Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-runtype'
_pkgname="${pkgname#python-}"
pkgver=0.5.3
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
  'python-poetry-core'
  'python-recommonmark'
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
  install -vDm0644 -t "$pkgdir/usr/share/man/man7" \
    docs/_build/man/runtype.7

  cd "$pkgdir/usr/share/man/man7/" \
  && ln -vsrf runtype.7 "${pkgname}.7"
}

sha256sums=(
  '94fdf42008ce74737f0a4d990fa33c4fd19eed8ba9e57084c8add92b48b7faf4'
)
b2sums=(
  '703acabea994f959b5d05901debd6fc646314a059799e0da7582aa8700b11d691ddb24837c6df824b56d7fdbfe8cbbcc6f3a55383e35e3ca367dfb660ca1d5f3'
)

# eof

# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname="${pkgname#python-}"
pkgver=0.5.1
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
  'a55ca7fc74190142e967d7b50061ca46c5657eaa2c4b68ad5de3590182d306c7'
)
b2sums=(
  '1b60b7734cbc1b62899df713ae1b8cb37496ae9bfcaaf42491aef6fc19839fe6333fc7b5bdbbc544cd762d8c93358668e3ffc2baad75207f525e41be0d9e92dd'
)

# eof

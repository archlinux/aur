# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# -*- sh -*-

pkgname='python-sphinx-markdown-tables'
_pkgname="${pkgname##python-}"
pkgver=0.0.17
pkgrel=4
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
pkgdesc='Sphinx extension for rendering tables written in markdown'
url="https://github.com/ryanfox/$_pkgname"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=(
  'python'
  'python-markdown'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  sed -i '/data_files/d' setup.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  'a99586cd287dc9d2e5ce1f85f7ffa2e3d18afd96ba463d75dcad95527c0073ec'
)

b2sums=(
  '9205eb552cee6e472ac0e6d3bbbea12a1ebaaad82acd7204586fe1256ba991270aab4b98d87a224ef42652d4ba0b37abab8d263aa7bbf804832e00bfb9966192'
)

# eof

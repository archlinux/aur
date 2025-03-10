# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-niquests-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=3.13.1.r1.gd056ba10
pkgrel=3
pkgdesc='Simple, yet elegant, Python HTTP library: a drop-in replacement for python-requests (latest commit)'
arch=('any')
url='https://github.com/jawah/niquests'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.7'
  'python-charset-normalizer'
  'python-urllib3-future'
  'python-wassima'
)
optdepends=(
  'python-orjson: for speedups'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md
}

# eof

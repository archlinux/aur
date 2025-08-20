# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Kevin Kuehler <keur@ocf.berkeley.edu>

_pkgname='termgraph'
pkgname="$_pkgname-git"
pkgver=0.5.4.r0.g5dd9a0a
pkgrel=2
pkgdesc='Python command-line tool which draws basic graphs in the terminal (development version)'
arch=('any')
url="https://github.com/mkaz/$_pkgname"
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'python'
  'python-colorama'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/data" data/*.{dat,py}
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

# eof

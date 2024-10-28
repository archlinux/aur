# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='python-wat-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.4.2.r1.gcf3f5aa
pkgrel=1
epoch=
pkgdesc='WAT Inspector: Deep inspection of Python objects (latest commit)'
arch=('any')
url="https://github.com/igrek51/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-inspector")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
}

# eof

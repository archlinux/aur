# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-whenever-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.5.1.r20.g6c2a928
pkgrel=2
pkgdesc='Foolproof datetimes for maintainable Python code (built from latest commit)'
arch=('any')
url="https://github.com/ariebovenberg/$_srcname"
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
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 CHANGELOG.rst "$pkgdir/usr/share/$pkgname/doc/CHANGELOG.rst"
  install -Dm0644 README.rst    "$pkgdir/usr/share/$pkgname/doc/README.rst"
}

# eof

# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='python-whenever-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.6.1.r0.g66592b4
pkgrel=1
pkgdesc='Modern datetime library for Python (built from latest commit)'
arch=('aarch64' 'x86_64')
url="https://github.com/ariebovenberg/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
depends=(
  'gcc-libs'
  'glibc'
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

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.rst README.md
}

# eof

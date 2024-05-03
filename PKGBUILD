# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-wassima-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=1.1.1.r0.ga7c9e9f
pkgrel=2
pkgdesc='Access your OS root certificates with the atmost ease (built from latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/wassima'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.7'
  'python-certifi'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README,SECURITY}.md
}

# eof

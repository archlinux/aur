# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-niquests-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=3.5.3.r0.ga84e41ca
pkgrel=1
pkgdesc='Simple, yet elegant, Python HTTP library: a drop-in replacement for python-requests (built from latest commit)'
arch=('any')
url='https://github.com/jawah/niquests'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-certifi'
  'python-charset-normalizer'
  'python-cryptography'
  'python-h2'
  'python-h11'
  'python-idna'
  'python-kiss-headers'
  'python-orjson'
  'python-typing_extensions'
  'python-qh3'
  'python-urllib3'
  'python-urllib3-future'
  'python-wassima'
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

  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof

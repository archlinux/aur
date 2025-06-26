# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alex Avance <aravance at gmail dot com>

_pkgname=sparklines
pkgname="python-$_pkgname"
pkgver=0.7.0
pkgrel=1
pkgdesc='Text-based sparkline command line mimicking those of Edward Tufte'
arch=('any')
url="https://github.com/deeplook/$_pkgname"
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'python'
  'python-termcolor'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=(
  "https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'efd2ff5126dac53ea4212c1e225f286beaf1907b35204465b65010db2eec4b2a'
)
provides=("$pkgname" "$_pkgname")
conflicts=("$_pkgname")
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTORS.txt README.rst
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.txt
}

# eof

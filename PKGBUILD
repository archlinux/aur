# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alex Avance <aravance at gmail dot com>

_pkgname=sparklines
pkgname="python-$_pkgname"
pkgver=0.5.0
pkgrel=3
pkgdesc='Text-based sparkline command line mimicking those of Edward Tufte'
arch=('any')
url="https://github.com/deeplook/$_pkgname"
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
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
  '069e48633fc1af354e9bbdfd0a644c1279d6632a572446aa9d741105f1177000'
)
provides=("$pkgname" "$_pkgname")
conflicts=("$_pkgname")
changelog="$pkgname.changelog"

build() {
  cd "${_pkgname}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -vrf "$pkgdir$_site_packages/tests"

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTORS.txt README.rst
}

# eof

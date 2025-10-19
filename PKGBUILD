# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-jetforce'
_pkgname="${pkgname/python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Experimental Gemini server written in Python'
arch=('any')
license=('LicenseRef-FloodgapFSL')  # SPDX-License-Identifier: LicenseRef-FloodgapFSL
url='https://github.com/michael-lazar/jetforce'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-pyopenssl'
  'python-twisted'
)
optdepends=(
  'python-standard-cgi: for running the example CGIs'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py
  install -vDm0755 -t "$pkgdir/usr/share/doc/$pkgname/examples/cgi" \
    examples/cgi/*.cgi
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  'a29637e168e1ac5b1d87f56786617f580737633b1344e1afd33177a1d2e5c2c8'
)
b2sums=(
  '6e4a5e13487fc74a3976f1b05efa0a632b062203705bc90f6470dfff60d844e79de155a93800aa2eba0942d83b646a5b77c141fb4f1f85819a63cc3c191e8764'
)

# eof

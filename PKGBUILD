# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alex Avance <aravance at gmail dot com>

_pkgname=sparklines
pkgname="python-$_pkgname"
pkgdesc='Text-based sparkline command line mimicking those of Edward Tufte'
pkgver=1.0.0
pkgrel=1
url="https://github.com/deeplook/$_pkgname"
changelog="$pkgname.changelog"
arch=('any')
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-termcolor'
)
optdepends=(
  'python-psutil: needed to rune the example(s)'
  'python-textual: needed to rune the example(s)'
)
provides=("$pkgname" "$_pkgname")
options=('!strip')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'fe7a7b9293c769e8b60e5403b10c11543fc22c683ef1272385d9cff5142274c0'
)

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md CONTRIBUTORS.txt README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.*
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.txt
}

# eof

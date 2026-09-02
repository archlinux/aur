# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (pre-compiled)'
pkgver=2.0.3
pkgrel=1
url='https://github.com/jawah/qh3'
changelog="$_pkgname.changelog"
arch=('x86_64')
license=('BSD-3-Clause')
makedepends=('python-installer')
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-brotli'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
_wheel="qh3-$pkgver-cp314-cp314t-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("$url/releases/download/v$pkgver/$_wheel")
sha256sums=('73845b61987f44c5d55f9606a38b4078cac7e816dadeeaceb35a49ff741d4c8e')

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -Dm0644 \
    "$_srcname-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _dir in licenses; do
    pushd "$pkgdir/usr/share/$_dir/"
    ln -srf "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof

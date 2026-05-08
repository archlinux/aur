# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='leaf-markdown-viewer'
pkgname="$_pkgname-bin"
pkgdesc='Leaf if a terminal markdown previewer with a GUI-like experience (pre-compiled)'
pkgver=1.20.0
pkgrel=1
url='https://github.com/RivoLink/leaf'
changelog="$pkgname.changelog"
arch=('x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc' 'libgcc')
provides=(leaf{,-markdown-viewer})
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/RivoLink/leaf/refs/heads/main'
source=(
  "leaf-$pkgver-$CARCH.bin::$url/releases/download/$pkgver/leaf-linux-${CARCH/arm64/aarch64}"
  "LICENSE-MIT.txt::$_rawurl/LICENSE"
  "CHANGELOG-$pkgver.md::$_rawurl/CHANGELOG.md"
  "CONTRIBUTING-$pkgver.md::$_rawurl/CONTRIBUTING.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "SECURITY-$pkgver.md::$_rawurl/SECURITY.md"
  "TESTING-$pkgver.md::$_rawurl/TESTING.md"
)
sha256sums=(
  '6edf1057c8f1bca65e3da067283148040a84d670f3bfcf8e2cb01b486af58507'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

build() {
  : binary is pre-built
}

package() {
  install -Dm0755 "leaf-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/leaf"
  install -Dm0644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in {CHANGELOG,CONTRIBUTING,README,SECURITY,TESTING}; do
    install -Dm0644 "$_doc-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof

# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=10.2.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
_flavour='linux'
_docs=(
  "CHANGELOG-$pkgver.md::$_rawurl/CHANGELOG.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "$_rawurl/LICENSE"
)
_skip=('SKIP' 'SKIP' 'SKIP')  # to my Lou!
source_aarch64=(
  "$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour-arm.tar.gz"
  "${_docs[@]}"
)
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "${_docs[@]}"
)
changelog="$pkgname.changelog"

build() {
  ./docfd --help=groff > docfd.1
}

package() {
  install -vsDm0755 -t "$pkgdir/usr/bin" docfd
  install -vDm0644  -t "$pkgdir/usr/share/man/man1" docfd.1

  for _doc in CHANGELOG README; do
    install -vDm0644 "$_doc-$pkgver.md" \
      "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

sha256sums_aarch64=(
  'a5f44f517a14dc57837549cd6a4328ffbe6880a01936f272fe6fc278f882e393'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  'c09e040418085df8eeb8ad61c5db72ff73763ca5434a7a58b4a8573be357aa19'
  "${_skip[@]}"
)

# eof

# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=10.0.0
pkgrel=3
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
      "$pkgdir/usr/share/docs/$pkgname/$_doc.md"
  done

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums_aarch64=(
  'f8867f8ce8de57fbefcf3d4dc127016aaab29fc5e849c37d7b807021adf98927'
  'SKIP' 'SKIP' 'SKIP'
)
sha256sums_x86_64=(
  '8298959f312bc9396c4e9dbc2e63edc00f0d500297991e43373102db68daa40d'
  'SKIP' 'SKIP' 'SKIP'
)

# eof

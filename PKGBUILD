# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname="docfd"
_pkgauthor="darrenldl"
pkgname="${_pkgname}-bin"
pkgver=11.0.1
pkgrel=2
pkgdesc='TUI multiline fuzzy document finder'
arch=('x86_64' 'aarch64')
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
source_x86_64=(
  "$_pkgname-$pkgver-${arch[0]}.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "${_docs[@]}"
)
source_aarch64=(
  "$_pkgname-$pkgver-${arch[1]}.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour-arm.tar.gz"
  "${_docs[@]}"
)
sha256sums_x86_64=('7b781517bf5035eb62fd8b8b8dcc06f25afccafd206b18c2b0285244a225b756'
                   'ab8fbe17e4aa0f80fed31ffb43a8e68321a6a8d7f9548d23082e86471cde0f45'
                   'b072284b7104ee9c6546cf0782f2d78e0ca68383d3f2555e173cbb0154dcdab0'
                   '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_aarch64=('d324968a4359dd24a51a84ab4e2b992f31bc4aa7e66c1973ad5c7286d2ae13e1'
                    'ab8fbe17e4aa0f80fed31ffb43a8e68321a6a8d7f9548d23082e86471cde0f45'
                    'b072284b7104ee9c6546cf0782f2d78e0ca68383d3f2555e173cbb0154dcdab0'
                    '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')

changelog="$pkgname.changelog"

build() {
  ./docfd --help=groff > docfd.1
}

package() {
  install -vsDm0755 -t "$pkgdir/usr/bin" docfd
  install -vDm0644  -t "$pkgdir/usr/share/man/man1" docfd.1

  for _doc in CHANGELOG README; do
    install -vDm0644 "$_doc-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof

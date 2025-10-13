# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname="docfd"
_pkgauthor="darrenldl"
pkgname="${_pkgname}-bin"
pkgver=12.0.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder'
arch=('x86_64' 'aarch64')
url='https://github.com/darrenldl/docfd'
_rawurl="https://raw.githubusercontent.com/darrenldl/docfd/${pkgver}"
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
sha256sums_x86_64=('28a7b71354d249ff0bfd29ed726b8f745792b501b30c74ba61404c33e84ac34f'
                   '80fa9f2db69b54c12086d74a751918e11b7c5c671579e38e38c62c0e53f274b1'
                   'a94a0b878fa32df34a4b9cdb75f83d421ec9d49a44583cc1c5f5ec17f626c3a8'
                   '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_aarch64=('1f7cbf987ece180cab3cf0052d173dc16d6c141ca2a231ec49795650d3f2ef4b'
                    '80fa9f2db69b54c12086d74a751918e11b7c5c671579e38e38c62c0e53f274b1'
                    'a94a0b878fa32df34a4b9cdb75f83d421ec9d49a44583cc1c5f5ec17f626c3a8'
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

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname="docfd"
_pkgauthor="darrenldl"
pkgname="${_pkgname}-bin"
pkgver=13.1.3
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
sha256sums_x86_64=('250504f4cc2484ee7413ccfda2b6bc8d95a4895dcba5e38cf86c1b3005e75ab7'
                   '814531fcb2c5686425d50c95759062f52f2bc04786e64eeeca110c5635c37711'
                   'f42cb5f15797b4ebf479a264e41473f5e39c52a14a9bbdad5fdece6316011f12'
                   '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_aarch64=('c5bfab8244aa513b1b603c4307c4c2d1521327e4b55265d9eb60c116d64f1787'
                    '814531fcb2c5686425d50c95759062f52f2bc04786e64eeeca110c5635c37711'
                    'f42cb5f15797b4ebf479a264e41473f5e39c52a14a9bbdad5fdece6316011f12'
                    '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')

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

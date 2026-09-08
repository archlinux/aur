# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname="docfd"
_pkgauthor="darrenldl"
pkgname="${_pkgname}-bin"
pkgver=13.1.1
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
sha256sums_x86_64=('072ba098e2f37aa74a755de4d57e24502a4f0b56ba7f544588c817ceab156e85'
                   '24a395cd80eae287f5374a2b33bd31498edef2768fa5f49009274903a7cdb6e7'
                   '919d185a40c4ef1c37692fdfcd0be23f2b5554005918f0aeb75e597122bfc9b0'
                   '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_aarch64=('7dc2fdd9acd9e14979e0443ee69e0dfd66b7f901a2ac1a7d3092cd221659ba5e'
                    '24a395cd80eae287f5374a2b33bd31498edef2768fa5f49009274903a7cdb6e7'
                    '919d185a40c4ef1c37692fdfcd0be23f2b5554005918f0aeb75e597122bfc9b0'
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

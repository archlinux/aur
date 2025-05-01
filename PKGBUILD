# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname="docfd"
_pkgauthor="darrenldl"
pkgname="${_pkgname}-bin"
pkgver=11.0.1
pkgrel=1
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
                   '324ff79fdd4701ed0c6540e5a88d01d4a7d3eabcdf2895505eee5ab49fe65265'
                   '8998b5e3388693e68700fda237a4887655a39d1d1d138f7d61414b2391b84d6a'
                   '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_aarch64=('d324968a4359dd24a51a84ab4e2b992f31bc4aa7e66c1973ad5c7286d2ae13e1'
                    '324ff79fdd4701ed0c6540e5a88d01d4a7d3eabcdf2895505eee5ab49fe65265'
                    '8998b5e3388693e68700fda237a4887655a39d1d1d138f7d61414b2391b84d6a'
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

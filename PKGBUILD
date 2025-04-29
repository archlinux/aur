# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
_pkgauthor="darrenldl"
pkgver=11.0.0
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
source_aarch64=(
  "$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour-arm.tar.gz"
  "${_docs[@]}"
)
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "${_docs[@]}"
)
sha256sums_aarch64=('5165525032fae2f731438fe23d7607ff92df3b6ea146b9e104d2b10b98364bb9'
                    'ff1af92ab4907f0d8871b7551cd0cc616b8ccbee3bd7c1568b2e24b7bc612724'
                    '8998b5e3388693e68700fda237a4887655a39d1d1d138f7d61414b2391b84d6a'
                    '05b43717c1e0f368743f7544e68bc43a2d96a2cd4df4a16190f290cd6e6fb528')
sha256sums_x86_64=('0e1d38eca16b3fba756ad10f5021e5b28a5be2771a60c434044ea2cc4fcf454b'
                   'ff1af92ab4907f0d8871b7551cd0cc616b8ccbee3bd7c1568b2e24b7bc612724'
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

# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname=icann-rdap
pkgname="$_pkgname-bin"
pkgver=0.0.21
pkgrel=5
#epoch=
pkgdesc='ICANN implementation of the Registry Data Access Protocol [RDAP] (pre-compiled)'
arch=('aarch64' 'x86_64')
url="https://github.com/icann/$_pkgname"
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
#groups=()
depends=('gcc-libs' 'glibc')
#makedepends=()
#checkdepends=()
#optdepends=()
provides=('rdap' "$_pkgname")
conflicts=('openrdap-client' "${provides[@]}")
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source_aarch64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
source_x86_64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
#noextract=()
#validpgpkeys=()

package() {
  # Binaries
  install -vDm0755 -t "$pkgdir/usr/bin" \
    rdap{,-srv{,-{data,store,test-data}},-test}

  # Docs (READMEs)
  install -vDm0644 "README-$pkgver.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  for _xxx in cli srv; do
    install -vDm0644 "README-$_xxx-$pkgver.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-$_xxx.md"
  done

  # Licenses (only the MIT license is actually required here)
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-*
}

sha256sums_aarch64=(
  '7657a8c799ccccff2077c131ca813b2807599810edb376dbff47778d8a89a706'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha256sums_x86_64=(
  '00d074ca3c96cc0ca1a804e936cdc13a0b492bd3867da511ad361f04aeea932e'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof

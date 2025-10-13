# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname=icann-rdap
pkgname="$_pkgname-bin"
pkgver=0.0.24
pkgrel=1
pkgdesc='ICANN implementation of the Registry Data Access Protocol [RDAP] (pre-compiled)'
arch=('aarch64' 'x86_64')
url="https://github.com/icann/$_pkgname"
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
depends=('gcc-libs' 'glibc')
provides=('rdap' "$_pkgname")
conflicts=('openrdap-client' "${provides[@]}")
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
_skip=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
  '399e550c33ac33c4bc26fae0b4400ad61de3e018244409f18f78654d5a976c76'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  '92ceae2844add20995ce18d0edebb665521da751c6a77a3d6e2baac457c84a03'
  "${_skip[@]}"
)

# eof

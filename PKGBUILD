# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='icann-rdap'
pkgname="$_pkgname-bin"
pkgver=0.0.26
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

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && {
      test -d "$pkgname" || continue
      ln -vsf "$pkgname" "$_pkgname"
    }
  done
}

sha256sums_aarch64=(
  'f08fcd140d18bf15a0a85ec269506dc254903dbcdb9a6b3865b52c8be95a83c9'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  '5ad5968dde0b6c69751a83267d543cc82ff64862edaaa8fe3e9e5f506279d1a0'
  "${_skip[@]}"
)

# eof

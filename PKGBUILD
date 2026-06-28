# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gsd-browser-bin
_pkgname=gsd-browser
pkgver=0.2.2
pkgrel=1
pkgdesc="Browser automation CLI powered by Chrome DevTools Protocol — 92 commands for navigation, interaction and inspection (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/open-gsd/gsd-browser"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('gsd-browser')
conflicts=('gsd-browser')
# The npm package (@opengsd/gsd-browser) is only a Node shim whose postinstall
# downloads this very binary from GitHub Releases. We ship the release binary
# directly, so no Node and no install-time network fetch are involved.
source=(
  "$pkgname-$pkgver-LICENSE-MIT::https://raw.githubusercontent.com/open-gsd/$_pkgname/v$pkgver/LICENSE-MIT"
  "$pkgname-$pkgver-LICENSE-APACHE::https://raw.githubusercontent.com/open-gsd/$_pkgname/v$pkgver/LICENSE-APACHE"
)
source_x86_64=("$_pkgname-$pkgver-x86_64::https://github.com/open-gsd/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-x64")
source_aarch64=("$_pkgname-$pkgver-aarch64::https://github.com/open-gsd/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64")
sha256sums=(
  '36b8eb7531081aec963f5cd5ee719d3d47c3167acba6e1a8a59b7443463fe7d0'
  '75192538785779e73e7d2cfa31a99f2d888d117e6327bc6f842ad019f83392f8'
)
sha256sums_x86_64=('5489cb000fe140378739d6585b4e45d53bbe4cdcc5c50c398ca080ba5d0feb76')
sha256sums_aarch64=('1c0df91cc3cab131f0d2e24fab4dbbf0b916eb2e331661d82ade00949d9ebd20')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/gsd-browser"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE-MIT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE-APACHE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
# vim:set ts=2 sw=2 et:

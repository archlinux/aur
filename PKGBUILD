# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=themis-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A theme orchestrator CLI for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/TwoWells/Themis"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
provides=('themis')
conflicts=('themis')
_target="x86_64-unknown-linux-gnu"
# The release tarball ships only the `themis` binary, so the AGPL LICENSE is
# fetched separately from the tagged tree.
source=("themis-$pkgver-$_target.tar.gz::https://github.com/TwoWells/Themis/releases/download/v$pkgver/themis-$_target.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/TwoWells/Themis/v$pkgver/LICENSE")
sha256sums=('3ce410c9ecb6381454054ecdb130b985c1f2423194f1ba621fafa4be92bae194'
    '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 "themis" "$pkgdir/usr/bin/themis"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "./themis" completions bash > "$pkgdir/usr/share/bash-completion/completions/themis"
    "./themis" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_themis"
    "./themis" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/themis.fish"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

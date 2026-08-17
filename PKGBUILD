# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>
pkgname=sct-rs-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="Local-first SNOMED CT toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/pacharanero/sct"
license=('AGPL-3.0-or-later')
provides=("sct-rs=${pkgver}")
conflicts=('sct-rs' 'sct')
source_x86_64=("sct-rs-bin-${pkgver}-x86_64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.23.2/sct-linux-x86_64.tar.gz")
source_aarch64=("sct-rs-bin-${pkgver}-aarch64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.23.2/sct-linux-aarch64.tar.gz")
sha256sums_x86_64=('32e353587bcfcc600afcd6e8b48688097b7366947d51f4db4f43de2306763e1c')
sha256sums_aarch64=('621d294aeb5c1ffcd3205909783d4829aaf8488cd40f83ff6b5ae603507209d0')

package() {
  install -Dm755 "${srcdir}/sct" "${pkgdir}/usr/bin/sct"

  "${srcdir}/sct" completions bash > sct.bash
  "${srcdir}/sct" completions zsh > _sct
  "${srcdir}/sct" completions fish > sct.fish
  install -Dm644 sct.bash "${pkgdir}/usr/share/bash-completion/completions/sct"
  install -Dm644 _sct "${pkgdir}/usr/share/zsh/site-functions/_sct"
  install -Dm644 sct.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sct.fish"
}

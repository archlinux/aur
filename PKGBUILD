# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>
pkgname=sct-rs-bin
pkgver=0.18.5
pkgrel=1
pkgdesc="Local-first SNOMED CT toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/pacharanero/sct"
license=('AGPL-3.0-or-later')
provides=("sct-rs=${pkgver}")
conflicts=('sct-rs' 'sct')
source_x86_64=("sct-rs-bin-${pkgver}-x86_64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.18.5/sct-linux-x86_64.tar.gz")
source_aarch64=("sct-rs-bin-${pkgver}-aarch64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.18.5/sct-linux-aarch64.tar.gz")
sha256sums_x86_64=('a97adffd4ea743fd0f5a48657e5b540b994d03d86667bebd433287035ad5bdf9')
sha256sums_aarch64=('07ef9cffc7b303082d7fe2c3cbd7c61b7742fffacf9405e80b9e366eeb78f352')

package() {
  install -Dm755 "${srcdir}/sct" "${pkgdir}/usr/bin/sct"

  "${srcdir}/sct" completions bash > sct.bash
  "${srcdir}/sct" completions zsh > _sct
  "${srcdir}/sct" completions fish > sct.fish
  install -Dm644 sct.bash "${pkgdir}/usr/share/bash-completion/completions/sct"
  install -Dm644 _sct "${pkgdir}/usr/share/zsh/site-functions/_sct"
  install -Dm644 sct.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sct.fish"
}

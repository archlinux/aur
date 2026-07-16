# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>
pkgname=sct-rs-bin
pkgver=0.18.8
pkgrel=1
pkgdesc="Local-first SNOMED CT toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/pacharanero/sct"
license=('AGPL-3.0-or-later')
provides=("sct-rs=${pkgver}")
conflicts=('sct-rs' 'sct')
source_x86_64=("sct-rs-bin-${pkgver}-x86_64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.18.8/sct-linux-x86_64.tar.gz")
source_aarch64=("sct-rs-bin-${pkgver}-aarch64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.18.8/sct-linux-aarch64.tar.gz")
sha256sums_x86_64=('0ee67b5afadd452aee4d3d9c0895d5fe15d9dd65b55f43dc137e087b3e0cb2d3')
sha256sums_aarch64=('0d2dc82178a6217e99a4a9b4c4d0d48bd1730e649171ac9eebc9d45a525f8d62')

package() {
  install -Dm755 "${srcdir}/sct" "${pkgdir}/usr/bin/sct"

  "${srcdir}/sct" completions bash > sct.bash
  "${srcdir}/sct" completions zsh > _sct
  "${srcdir}/sct" completions fish > sct.fish
  install -Dm644 sct.bash "${pkgdir}/usr/share/bash-completion/completions/sct"
  install -Dm644 _sct "${pkgdir}/usr/share/zsh/site-functions/_sct"
  install -Dm644 sct.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sct.fish"
}

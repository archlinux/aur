# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>
pkgname=sct-rs-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Local-first SNOMED CT toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/pacharanero/sct"
license=('AGPL-3.0-or-later')
provides=("sct-rs=${pkgver}")
conflicts=('sct-rs' 'sct')
source_x86_64=("sct-rs-bin-${pkgver}-x86_64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.27.0/sct-linux-x86_64.tar.gz")
source_aarch64=("sct-rs-bin-${pkgver}-aarch64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.27.0/sct-linux-aarch64.tar.gz")
sha256sums_x86_64=('6cbd20e8c1a797ea2a843a4ab1c05073be7557108e5548814357ee84495ca3b5')
sha256sums_aarch64=('c366d7437730c1949d307b8698b26998ac47d6b62207f63cd0e6eb8a6b69229b')

package() {
  install -Dm755 "${srcdir}/sct" "${pkgdir}/usr/bin/sct"

  "${srcdir}/sct" completions bash > sct.bash
  "${srcdir}/sct" completions zsh > _sct
  "${srcdir}/sct" completions fish > sct.fish
  install -Dm644 sct.bash "${pkgdir}/usr/share/bash-completion/completions/sct"
  install -Dm644 _sct "${pkgdir}/usr/share/zsh/site-functions/_sct"
  install -Dm644 sct.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sct.fish"
}

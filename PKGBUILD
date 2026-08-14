# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>
pkgname=sct-rs-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Local-first SNOMED CT toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/pacharanero/sct"
license=('AGPL-3.0-or-later')
provides=("sct-rs=${pkgver}")
conflicts=('sct-rs' 'sct')
source_x86_64=("sct-rs-bin-${pkgver}-x86_64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.23.1/sct-linux-x86_64.tar.gz")
source_aarch64=("sct-rs-bin-${pkgver}-aarch64.tar.gz::https://github.com/pacharanero/sct/releases/download/v0.23.1/sct-linux-aarch64.tar.gz")
sha256sums_x86_64=('fa6d5c8f0314dc84d27883697118c44f5344134f917b25172100dac37d43077e')
sha256sums_aarch64=('fa1bdc77e112befcd6d120b3b247536b067525600110637e675c842039112670')

package() {
  install -Dm755 "${srcdir}/sct" "${pkgdir}/usr/bin/sct"

  "${srcdir}/sct" completions bash > sct.bash
  "${srcdir}/sct" completions zsh > _sct
  "${srcdir}/sct" completions fish > sct.fish
  install -Dm644 sct.bash "${pkgdir}/usr/share/bash-completion/completions/sct"
  install -Dm644 _sct "${pkgdir}/usr/share/zsh/site-functions/_sct"
  install -Dm644 sct.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sct.fish"
}

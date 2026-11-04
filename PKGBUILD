# Maintainer: agony <27015 at riseup dot net>

pkgname=ghostunnel-bin
pkgver=1.11.5
pkgrel=1
pkgdesc='TLS proxy with mutual authentication for securing non-TLS services (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/ghostunnel/ghostunnel'
license=('Apache-2.0')
depends=('glibc')
provides=("ghostunnel=${pkgver}")
conflicts=('ghostunnel')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("ghostunnel-${pkgver}-x86_64::${_release}/ghostunnel-linux-amd64")
source_aarch64=("ghostunnel-${pkgver}-aarch64::${_release}/ghostunnel-linux-arm64")
sha256sums_x86_64=('1dd8d864330bf59132b5d49083c31dd626b77a2bc409d3457858ae6ccec4e997')
sha256sums_aarch64=('fdfac8316a7cf9ac3111bbfe087cb020b245d30488b396ac7ad3a099885f2664')

build() {
  install -m755 "ghostunnel-${pkgver}-${CARCH}" ghostunnel
  ./ghostunnel --help-custom-man > ghostunnel.1
  ./ghostunnel --completion-script-bash > ghostunnel.bash
  ./ghostunnel --completion-script-zsh > ghostunnel.zsh
}

package() {
  install -Dm755 ghostunnel -t "${pkgdir}/usr/bin"
  install -Dm644 ghostunnel.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 ghostunnel.bash "${pkgdir}/usr/share/bash-completion/completions/ghostunnel"
  install -Dm644 ghostunnel.zsh "${pkgdir}/usr/share/zsh/site-functions/_ghostunnel"
}

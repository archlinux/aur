# Maintainer: agony <27015 at riseup dot net>

pkgname=gator-bin
pkgver=3.23.1
pkgrel=1
pkgdesc='Suite of authorship tools for Gatekeeper policies (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/open-policy-agent/gatekeeper'
license=('Apache-2.0')
provides=("gator=${pkgver}")
conflicts=('gator')
_release="${url}/releases/download/v${pkgver}"
source=("gator-${pkgver}-NOTICE::https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v${pkgver}/NOTICE")
source_x86_64=("${_release}/gator-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_release}/gator-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('7d4302ff15270639b7f8d25e9dbfb988b6d4075a36d0e47fdb0d4a91661b18d7')
sha256sums_x86_64=('c268d7b809c9fe59a110ab0bf7c296ab00b0b6c894c209cd15e94194590291bb')
sha256sums_aarch64=('2d4bd0e28e708c2893a66fdca652f1d775b23fc5a3c07571fd314ba06d19ff2b')

build() {
  for shell in bash fish zsh; do
    ./gator completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 gator -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/gator"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gator.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_gator"
  install -Dm644 "gator-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

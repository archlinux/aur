# Maintainer: David Birks <david@birks.dev>

pkgname=gascity-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Orchestration-builder SDK for multi-agent coding workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/gastownhall/gascity'
license=('MIT')
provides=('gascity')
conflicts=('gascity')
depends=('tmux' 'jq' 'git' 'procps-ng' 'lsof')
optdepends=('dolt: beads data plane'
            'github-cli: GitHub gate checks')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/gastownhall/gascity/releases/download/v${pkgver}/gascity_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/gastownhall/gascity/releases/download/v${pkgver}/gascity_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('b9411c0131a6042addd9a162ae2ae34c27ea86129ba7f5b4d7c2a219cb079f1c579dc43bda61ceb961eeab8a9210577265f14baf546aee1a082e771e197fef87')
b2sums_aarch64=('b9411c0131a6042addd9a162ae2ae34c27ea86129ba7f5b4d7c2a219cb079f1c579dc43bda61ceb961eeab8a9210577265f14baf546aee1a082e771e197fef87')

package() {
  install -Dm755 gc "${pkgdir}/usr/bin/gc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/gc" completion bash > "${pkgdir}/usr/share/bash-completion/completions/gc"
  "${pkgdir}/usr/bin/gc" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_gc"
  "${pkgdir}/usr/bin/gc" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/gc.fish"
}

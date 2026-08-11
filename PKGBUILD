# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: David Birks <david@birks.dev>

pkgname=gascity-bin
pkgver=1.4.0
pkgrel=2
pkgdesc='Orchestration-builder SDK for multi-agent coding workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/gastownhall/gascity'
license=('MIT')
depends=(
  'git'
  'jq'
  'lsof'
  'dolt'
  'beads'
  'procps-ng'
  'tmux'
)
optdepends=(
  'github-cli: GitHub gate checks'
  'util-linux: flock for the default work-tracking backend'
)
provides=("gascity=${pkgver}")
conflicts=('gascity' 'graphviz')
options=('!strip' '!debug')
source_x86_64=("https://github.com/gastownhall/gascity/releases/download/v${pkgver}/gascity_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/gastownhall/gascity/releases/download/v${pkgver}/gascity_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f6bd0bfaf2acc141642227629394dd3279761df4e1800235551af24d98b9cae0')
sha256sums_aarch64=('672eb244613812332a6524a982e0c3455956f1813f4fa9a761e5f6103259a099')

package() {
  install -Dm755 gc "${pkgdir}/usr/bin/gc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Shell completions
  install -dm755 \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"

  ./gc completion bash > "${pkgdir}/usr/share/bash-completion/completions/gc"
  ./gc completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_gc"
  ./gc completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/gc.fish"
}

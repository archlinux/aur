# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: David Birks <david@birks.dev>

pkgname=gascity-bin
pkgver=1.5.1
pkgrel=1
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
sha256sums_x86_64=('3a405a5455eb6216f7f65d4516a614e4913d83bc8964df8800e0533ab2d40044')
sha256sums_aarch64=('e75083c01562b1a66cb1931c336139693f51effa0e48dc91c402556bddf50e72')

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

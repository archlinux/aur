# Maintainer: agony <27015 at riseup dot net>

pkgname=deja-vu-bin
pkgver=0.25.0
pkgrel=1
pkgdesc='Shared local memory, cross-agent handoff and code recovery for coding agents (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/vshulcz/deja-vu'
license=('MIT')
provides=("deja-vu=${pkgver}")
conflicts=('deja-vu' 'deja')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/deja-vu_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/deja-vu_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3a95763c34884cb26b322157b3a56a8b4b675eb39f979ea5c54e927092689b72')
sha256sums_aarch64=('605a54d0b67bac840d5bdfc4d7c045792507b20f7f545dde23229b5dae62a581')

build() {
  for shell in bash fish zsh; do
    ./deja completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 deja -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/deja"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/deja.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_deja"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

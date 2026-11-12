# Maintainer: agony <27015 at riseup dot net>

pkgname=deja-vu-bin
pkgver=0.24.2
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
sha256sums_x86_64=('642552f430d0962bce5504f22a98add1184968c7a83a933ea24b6830ebaf7948')
sha256sums_aarch64=('458012444109eec02e7bfb86ae491a04623e09cd30069db64553265c8e996be4')

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

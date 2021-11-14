# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=cr-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="cr is a tool designed to help GitHub repos self-host their own chart repos by adding Helm chart artifacts to GitHub Releases"
provides=('cr' 'chart-releaser')
url="https://github.com/helm/chart-releaser"
arch=('x86_64' 'aarch64' 'armv6h')
license=("APACHE")

source_x86_64=("${url}/releases/download/v${pkgver}/chart-releaser_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/chart-releaser_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/chart-releaser_${pkgver}_linux_armv6.tar.gz")

sha256sums_x86_64=('baed2315a9bb799efb71d512c5198a2a3b8dcd139d7f22f878777cffcd649a37')
sha256sums_aarch64=('0a07381443192f8745e72baa75ed1aee1ec11add881b5210e04b69b1b50c1be0')
sha256sums_armv6h=('10b36d4b8a500f607520ede735e9653ad204ed8bb32d299a26de62fca3c2828d')

package() {
  install -Dm755 "${srcdir}/cr" "${pkgdir}/usr/bin/cr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cr/LICENSE"

  "${pkgdir}/usr/bin/cr" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/cr"
  "${pkgdir}/usr/bin/cr" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/cr.fish"
  "${pkgdir}/usr/bin/cr" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_cr"
}

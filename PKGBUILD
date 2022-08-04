# Maintainer: Fukumakoto Kure <kure dot fukukmakoto dot at gmail dot com>
pkgname=jira-cli-bin
pkgdesc='Feature-rich interactive Jira command line.'
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url=https://github.com/ankitpokhrel/jira-cli
license=('MIT')
provides=('jira')
conflicts=('jira-cli')
_src="${url}/releases/download/v${pkgver}/jira_${pkgver}_linux"
source_x86_64=("$_src"_x86_64.tar.gz)
source_i686=("$_src"_i386.tar.gz)
source_aarch64=("$_src"_arm64.tar.gz)
source_armv6h=("$_src"_armv6.tar.gz)
sha256sums_x86_64=('13e179f241547a9f8f206f351ebcfa7b31aea2aa742ae04da1da72b7a84620da')
sha256sums_i686=('276f7b2918d6785082051adccc384c42bac56f865093888f715b960cb6fcb997')
sha256sums_aarch64=('95f885fcf06f7c1b5837556aabfbd7f429770771aabf68403953aafb89dfc19f')
sha256sums_armv6h=('97ca651b51690158272e3b779e4c6a074376eb13d39a11a89173f151be14d91f')

package() {
  local x86_64=x86_64 i686=i386 aarch64=arm64 armv6h=armv6
  cd "jira_${pkgver}_linux_${!CARCH}/bin"

  # Bin
  install -Dm755 jira -t "$pkgdir"/usr/bin
  
  # Completions
  ./jira completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/jira
  ./jira completion zsh  | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_jira
  ./jira completion fish | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/jira.fish
}
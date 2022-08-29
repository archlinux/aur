# Maintainer: Fukumakoto Kure <kure dot fukukmakoto dot at gmail dot com>
pkgname=jira-cli-bin
pkgdesc='Feature-rich interactive Jira command line.'
pkgver=1.1.0
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
sha256sums_x86_64=('af61390e1e029ef79b846e17a44fb2763f396965a9aca87a73794e698e5fe239')
sha256sums_i686=('c721e54e9c4acbb9fe4cea626c445e889b0f93d22d7f0855af131b6f3698e981')
sha256sums_aarch64=('839c378a07d164c3db65d5db17479d145cb8398fbb6e7745aec37ca232a9679a')
sha256sums_armv6h=('9e09a180b6583014c257c0effb79a09622fd5f526f95e7f003b0ed89517a029a')

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

# Maintainer: Fukumakoto Kure <kure dot fukukmakoto dot at gmail dot com>
pkgname=jira-cli-bin
pkgdesc='Feature-rich interactive Jira command line.'
pkgver=1.4.0
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
sha256sums_x86_64=('34f2aee621d2555d0e7e305a95e851dbb3bac695e893e95a339666a5d84da48d')
sha256sums_i686=('73ade14658dac6496be1ff2d80c9b7232026f220d69ec82472935e97fb5d3d59')
sha256sums_aarch64=('d0b328d1330b673081a0ee4d74f18835967006c530dd942d2674e6d115e42014')
sha256sums_armv6h=('2f323ea69015fd5d5d1d21c960a2d77078837614ea2185f2377c689b942f703f')

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

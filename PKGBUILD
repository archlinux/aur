# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.32.1
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint')
_src="${url}/releases/download/v${pkgver}/golangci-lint-${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_i686=("$_src"-386.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv6h=("$_src"-armv6.tar.gz)
source_armv7h=("$_src"-armv7.tar.gz)
sha256sums_x86_64=('913ada29a2d38313a10145baa7b86484d3634102c74732cb0fb97e10a195bb93')
sha256sums_i686=('018eb7d926dcef079bfcbd23841683f56f26480210541c919e9ce52610f4338f')
sha256sums_aarch64=('727211db865762f5752a95768bb7025c91706d074f32cb947cf1b39d69752f47')
sha256sums_armv6h=('a5f2885adca863ecdf62b2b328a5af6744bbee7acba247771cb99936c1dfe1c6')
sha256sums_armv7h=('fee67c418b861a8dd57f264be41a7a944d46aed77ef1a073b49ffe7ce81b73eb')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}

# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.58.1
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
sha256sums_x86_64=('2e7c1b2af70ecb7ce18da79a3951db7046dcb709566c018fb93c61e8733b2239')
sha256sums_i686=('dbc736f79adf678ba094f8173d7fbafebb0014e13aee5ab7ffc534e900862be2')
sha256sums_aarch64=('e78f55156ef7f8bd4a746aa695c6bd299dc0aa71b91ec066680d2c59e443708b')
sha256sums_armv6h=('056f1b2f779fe0fbe11033a2e78092e120534a2b13646e5a5bd1b4f9e001db2b')
sha256sums_armv7h=('cec68a698218513c9b16eef1ca1627207c142682cd1db9dbe7a1076b79d88a23')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"

	# Bin
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  
	# Completions
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
  ./golangci-lint completion fish | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/golangci-lint.fish
}

# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.49.0
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
sha256sums_x86_64=('5badc6e9fee2003621efa07e385910d9a88c89b38f6c35aded153193c5125178')
sha256sums_i686=('ef2860d90d83aee6713f697f23372cd93ac41a16439fdcb3c4ac86ba0f306860')
sha256sums_aarch64=('b57ed03d29b8ca69be9925edd67ea305b6013cd5c97507d205fbe2979f71f2b5')
sha256sums_armv6h=('4a41cff3af7f5304751f7bbf4ea617c14ebc1f88481a28a013e61b06d1f7102c')
sha256sums_armv7h=('14a9683af483ee7052dd0ce7d6140e0b502d6001bea3de606b8e7cce2c673539')

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

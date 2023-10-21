# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.55.0
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
sha256sums_x86_64=('2279579b0ac4e800fa27f8938ab7cdbb14ac91a5044df4f63d7fcac010a0537a')
sha256sums_i686=('b83a301ae607f4d605845dfcc262c874246104c27e160d06db5294e22bae14b9')
sha256sums_aarch64=('8eb0ed899a2033e234ee5394dff37f77ac6fec56645c8154e7d7c7e704aa7f4f')
sha256sums_armv6h=('826a6141f30de3bc3c58998db0d1535a85ed98c6c2e5cca88b9aed29c039df5f')
sha256sums_armv7h=('d6d22e270471c6b2a6c45c1b95026fab4e52398f1ef7487ac6ab9f98d84e0667')

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

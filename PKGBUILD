# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.53.1
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
sha256sums_x86_64=('6c2f261ca50f54fe06e7be599e7ff7f2f57751175e413944ebcdf67a61ec54ea')
sha256sums_i686=('8e8b25001097916ffbde25475cfb6520da4002ff51d83d43a0632859b93768c1')
sha256sums_aarch64=('854b47aa6108fcb3a798bd04269ffdd138a19b7942677be35a44d30ffa60526b')
sha256sums_armv6h=('0e26d7473c65be843e34b56f5943eacebc43fac6cb7c014e50ce1e2dd6929b8b')
sha256sums_armv7h=('67a2098be9df1a4b391ccd812750dccef8541e4b225afc7acbbef2b8f8c676e1')

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

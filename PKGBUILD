# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.56.0
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
sha256sums_x86_64=('3a6343a67ad1b682f351fe96621670e149dd2bcd11c1fd3e8b654030d39f8ebf')
sha256sums_i686=('67e0f56af0940f4343dd27ca6e42bf116914787c3eb75f0ec8820b82724c8b7d')
sha256sums_aarch64=('589dce35f449f8ee14993534bb1576a7f50006e5487cb782642cfd076efc66b6')
sha256sums_armv6h=('34e454869af79c7d2e58fa24042968af201fa5f2fcc514dd9e27e27ef2c59245')
sha256sums_armv7h=('9a720812dc6cea5064bc3f2a0fe9fa35a85b805e31ac729525b3080bfd896e14')

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

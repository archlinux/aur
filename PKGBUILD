# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.45.0
pkgrel=3
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
sha256sums_x86_64=('ca06a2b170f41a9e1e34d40ca88b15b8fed2d7e37310f0c08b7fc244c34292a9')
sha256sums_i686=('58bbcd8cde236aa13cc1edeb530c0b74ba147f59b277d90edd29aa0b69cda486')
sha256sums_aarch64=('4c83a0f70189e2b6656ca0216a22fb37087c1ffb10eb5df9a002bbea15c88354')
sha256sums_armv6h=('8b9efb2c39e5649ce99bf48650671ce84c376176ff4fcc1c1dfd81cf889b3ee5')
sha256sums_armv7h=('6431699fbd2b67ca1bc95bd9a5ec61e292b0113fc4cd0099911b22cce7ef4cf8')

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

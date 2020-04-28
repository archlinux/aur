# Maintainer: Matthias Lisin <ml@visu.li>
_pkg=golangci-lint
pkgname=$_pkg-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.25.1
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
conflicts=("$_pkg")

_src="${url}/releases/download/v${pkgver}/${_pkg}-${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_i686=("$_src"-386.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv6h=("$_src"-armv6.tar.gz)
source_armv7h=("$_src"-armv7.tar.gz)
sha256sums_x86_64=('350eb6c242707fc70367dd186b83e5fc0ce2603f357bdb3ee10d92106085f03f')
sha256sums_i686=('ff6828e1b340a0eca823b11ab3927ae906e3e46ab72f56dd100fbde520660526')
sha256sums_aarch64=('8b1eaf4570e124e88b92d8076dd692b9ceb6d83ad59ad6201c1cf68bc1deaf41')
sha256sums_armv6h=('1a06a780ef7467ff9ddf0ee185ccb980dbddc6d75557851e47a158f0f702284d')
sha256sums_armv7h=('c630427db9c08ef010134c8f39f9452b542ac49a30df37c3acba82eff518a29f')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "${_pkg}-${pkgver}-linux-${!CARCH}"
  install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
  install -Dm755 "$_pkg" "$pkgdir"/usr/bin/"$_pkg"
  ./"$_pkg" completion bash >"$pkgdir"/usr/share/bash-completion/completions/"$_pkg"
  ./"$_pkg" completion zsh >"$pkgdir"/usr/share/zsh/site-functions/"$_pkg"
}

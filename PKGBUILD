# Maintainer: Matthias Lisin <ml@visu.li>
_pkg=golangci-lint
pkgname="$_pkg"-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.25.0
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
sha256sums_x86_64=('2c9b36a140c5493cac46d596d80316645221f338099d74f001b0a4dc84728da8')
sha256sums_i686=('930e7c9613cbe83b961de5d9ccf9fcf5ad774711830336976e9548a6db397e8c')
sha256sums_aarch64=('b0dd1d44ec57161ec275425a2ed532340584a4ef534c54964291aeab599433e8')
sha256sums_armv6h=('09d35b964c2a03229cc52e521a488dae8c261f3f7a1a091bf074f2f2f8af1149')
sha256sums_armv7h=('592372c521afc2401af8269d6c5554cb72d5618b0db8b84d4af98a5faa0196eb')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "${_pkg}-${pkgver}-linux-${!CARCH}"
  install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
  install -Dm755 "$_pkg" "$pkgdir"/usr/bin/"$_pkg"
  ./"$_pkg" completion bash >"$pkgdir"/usr/share/bash-completion/completions/"$_pkg"
  ./"$_pkg" completion zsh >"$pkgdir"/usr/share/zsh/site-functions/"$_pkg"
}

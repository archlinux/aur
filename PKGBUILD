# Maintainer: Matthias Lisin <ml@visu.li>
_pkg=golangci-lint
pkgname="$_pkg"-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.24.0
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
sha256sums_x86_64=('241ca454102e909de04957ff8a5754c757cefa255758b3e1fba8a4533d19d179')
sha256sums_i686=('ff488423db01a0ec8ffbe4e1d65ef1be6a8d5e6d7930cf380ce8aaf714125470')
sha256sums_aarch64=('e245df27cec3827aef9e7afbac59e92816978ee3b64f84f7b88562ff4b2ac225')
sha256sums_armv6h=('835101fae192c3a2e7a51cb19d5ac3e1a40b0e311955e89bc21d61de78635979')
sha256sums_armv7h=('537bb2186987b5e68ad4e8829230557f26087c3028eb736dea1662a851bad73d')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "${_pkg}-${pkgver}-linux-${!CARCH}"
  install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
  install -Dm755 "$_pkg" "$pkgdir"/usr/bin/"$_pkg"
  ./"$_pkg" completion bash >"$pkgdir"/usr/share/bash-completion/completions/"$_pkg"
  ./"$_pkg" completion zsh >"$pkgdir"/usr/share/zsh/site-functions/"$_pkg"
}

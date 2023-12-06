# Maintainer: xeptore
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

pkgname=gohugo-extended-bin
pkgver=0.121.0
pkgrel=1
pkgdesc="Hugo - The world's fastest framework for building websites (Extended Edition)"
arch=('x86_64' 'aarch64')
url='https://gohugo.io/'
license=('Apache')
depends=('glibc')
conflicts=('hugo')
provides=('hugo')
source_x86_64=('https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_extended_0.121.0_linux-amd64.tar.gz')
source_aarch64=('https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_extended_0.121.0_linux-arm64.tar.gz')
sha256sums_x86_64=('2dc008f55cb842459b40382b1e30c6fec1d17d9098356287790b1dda6ab6e336')
sha256sums_aarch64=('d7d8f11fa9602074d7826dde6f4f5bd04217f46b3db7b0ea700bbedb9a72dbe6')

build() {
  cd "${srcdir}"
  ./hugo gen man --dir man
  ./hugo completion bash > hugo.bash-completion
  ./hugo completion fish > hugo.fish
  ./hugo completion zsh > hugo.zsh
}

package() {
  cd "${srcdir}"
  install -Dm755 hugo "${pkgdir}/usr/bin/hugo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/hugo/LICENSE"
  install -Dm644 man/*.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 hugo.bash-completion "${pkgdir}/usr/share/bash-completion/completions/hugo"
  install -Dm644 hugo.fish "${pkgdir}/usr/share/fish/vendor_completions.d/hugo.fish"
  install -Dm644 hugo.zsh "${pkgdir}/usr/share/zsh/site-functions/_hugo"
}

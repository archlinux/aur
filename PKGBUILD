# Maintainer: xeptore
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

pkgname=gohugo-extended-bin
pkgver=0.120.2
pkgrel=1
pkgdesc="Hugo - The world's fastest framework for building websites (Extended Edition)"
arch=('x86_64' 'aarch64')
url='https://gohugo.io/'
license=('Apache')
depends=('glibc')
conflicts=('hugo')
provides=('hugo')
source_x86_64=('https://github.com/gohugoio/hugo/releases/download/v0.120.2/hugo_extended_0.120.2_linux-amd64.tar.gz')
source_aarch64=('https://github.com/gohugoio/hugo/releases/download/v0.120.2/hugo_extended_0.120.2_linux-arm64.tar.gz')
sha256sums_x86_64=('979e767b2b6f776b803fed2e09b2c8e5aa7fe956d7fb76a010083d086ba5f531')
sha256sums_aarch64=('0299a61b4fbe56c7aabeff9308ed204bc098ff0fd25fde739343fded24e29561')

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

# Maintainer: xeptore
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

pkgname=gohugo-extended-bin
pkgver=0.116.1
pkgrel=1
pkgdesc="Hugo - The world's fastest framework for building websites (Extended Edition)"
arch=('x86_64' 'aarch64')
url='https://gohugo.io/'
license=('Apache')
depends=('glibc')
conflicts=('hugo')
provides=('hugo')
source_x86_64=('https://github.com/gohugoio/hugo/releases/download/v0.116.1/hugo_extended_0.116.1_linux-amd64.tar.gz')
source_aarch64=('https://github.com/gohugoio/hugo/releases/download/v0.116.1/hugo_extended_0.116.1_linux-arm64.tar.gz')
sha256sums_x86_64=('7b8b0b1c58cfde0f564f91eb2444312208a5ab55756f92d07ff9bd2b452af231')
sha256sums_aarch64=('f184de046e61020f5baf9c93b85c2d487fa5a5fe8f58216d585247ac983c3743')

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

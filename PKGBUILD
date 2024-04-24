# Maintainer: xeptore
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

pkgname=gohugo-extended-bin
pkgver=0.125.3
pkgrel=3
pkgdesc="Hugo - The world's fastest framework for building websites (Extended Edition)"
arch=('x86_64' 'aarch64')
url='https://gohugo.io/'
license=('Apache')
depends=('glibc')
conflicts=('hugo')
provides=('hugo')
source_x86_64=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('1f25fce9c8bb0e6dfa99af118dd20d4a210d53d76203b399f0589a98750cc5cf')
sha256sums_aarch64=('fe8c7379102947723c99e8addb01a4b62a3cac9f242950f4ec0ed3fdf8aa2578')

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

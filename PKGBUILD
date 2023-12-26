# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)
pkgname=gowebly-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="A language for writing HTML user interfaces in Go."
arch=('x86_64')
url="https://github.com/gowebly/gowebly"
license=('MIT')
provides=('gowebly')
conflicts=('gowebly')
sha256sums_x86_64=("432f1695e6afb4df93927b46673316afdf8f58fce7e33c127ec95b8eada94ca6")
source_x86_64=("gowebly-x64-${pkgver}.tar.gz::https://github.com/gowebly/gowebly/releases/download/v${pkgver}/gowebly_${pkgver}_linux_amd64.tar.gz")
build() {
  install -dm755 "completions"
  SHELL=zsh "./gowebly" completions > "completions/gowebly.zsh"
  SHELL=bash "./gowebly" completions > "completions/gowebly.bash"
  SHELL=fish "./gowebly" completions > "completions/gowebly.fish"
}
package() {
  install -Dm755 "./gowebly" "${pkgdir}/usr/bin/gowebly"
  
  install -Dm644 completions/gowebly.zsh "${pkgdir}/usr/share/zsh/site-functions/_gowebly"
  install -Dm644 completions/gowebly.bash "${pkgdir}/usr/share/bash-completion/completions/gowebly"
  install -Dm644 completions/gowebly.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gowebly.fish"
}


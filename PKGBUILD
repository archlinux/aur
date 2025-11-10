# Contributor: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
# Maintainer: tee < teeaur at duck dot com >
pkgname=k6-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('amd64' 'x86_64' 'arm64')
url="https://k6.io"
license=('AGPL-3.0-or-later')
options=(!emptydirs)
source_x86_64=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-$arch.tar.gz")
sha256sums_x86_64=('58fa87283f5d5b11bc6824d9204e8a38266c9977f2c4d0a960ce1b5beeaae517')

package() {
  cd "$srcdir/k6-v${pkgver}-linux-amd64"
  install -D k6 "$pkgdir/usr/bin/k6"

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  ./k6 completion bash > "${pkgdir}/usr/share/bash-completion/completions/k6"

  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ./k6 completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_k6"

  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  ./k6 completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/k6.fish"
}
# vim:set noet sts=0 sw=4 ts=4:

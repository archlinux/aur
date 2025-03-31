# Contributor: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
# Maintainer: tee < teeaur at duck dot com >
pkgname=k6-bin
pkgver=0.58.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('amd64' 'x86_64' 'arm64')
url="https://k6.io"
license=('AGPL3')
options=(!emptydirs)
source_x86_64=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-$arch.tar.gz")
sha256sums_x86_64=('e487d8775a306ed1f7232855a37dee4e42b7a53b5a991009a267305c06f56dab')

package() {
  cd $srcdir/k6-v${pkgver}-linux-amd64
  install -D k6 $pkgdir/usr/bin/k6
  # build bash completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  ./k6 completion bash > "${pkgdir}/usr/share/bash-completion/completions/k6"

  # build zsh completions
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ./k6 completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_k6"

  # build fish completions
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  ./k6 completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/k6.fish"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

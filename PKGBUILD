# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('47f30a211953839b5d2ff4bee88427091f8f0dda5fd563c47b244b69cb01e92b')

build() {
  cd "gh_${pkgver}_linux_amd64"

  # Build shell completion files
  mkdir -p _completions
  bin/gh completion -s bash > _completions/bash
  bin/gh completion -s zsh > _completions/zsh
  bin/gh completion -s fish > _completions/fish
}

package() {
  cd "gh_${pkgver}_linux_amd64"

  install -Dm755 bin/gh "${pkgdir}/usr/bin/gh"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/github-cli-bin"

  install -Dm644 _completions/bash "${pkgdir}/usr/share/bash-completion/completions/gh"
  install -Dm644 _completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_gh"
  install -Dm644 _completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/gh.fish"
}

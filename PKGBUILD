# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2479212df952a674853a7b65ab7537e2ecefa6a0c431e373fd7b5c36fb5d4f07')

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

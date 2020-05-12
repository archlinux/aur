# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.8.0
pkgrel=3
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7eb2633f8360239362726ac4265ef07a900bdc3f90d0f3dc36d7d03bce072d52')

package() {
  cd "gh_${pkgver}_linux_amd64"

  install -Dm755 bin/gh "${pkgdir}/usr/bin/gh"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/github-cli-bin"

  install -Dm644 ./*.md -t "$pkgdir/usr/share/doc/github-cli"

  install -Dm644 <(bin/gh completion -s bash) "$pkgdir/usr/share/bash-completion/completions/gh"
  install -Dm644 <(bin/gh completion -s fish) "$pkgdir/usr/share/fish/vendor_completions.d/gh.fish"
  install -Dm644 <(bin/gh completion -s zsh)  "$pkgdir/usr/share/zsh/site-functions/_gh"
}

# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
optdepends=('git: required for most functionality')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('11315438e03487b512462f3e7e26fa587bd589ad5764e863fef132014c5287da')

package() {
  cd "gh_${pkgver}_linux_amd64"

  install -Dm755 bin/gh "${pkgdir}/usr/bin/gh"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/github-cli-bin"

  install -Dm644 share/man/man1/* -t "$pkgdir/usr/share/man/man1"

  install -Dm644 <(bin/gh completion -s bash) "$pkgdir/usr/share/bash-completion/completions/gh"
  install -Dm644 <(bin/gh completion -s fish) "$pkgdir/usr/share/fish/vendor_completions.d/gh.fish"
  install -Dm644 <(bin/gh completion -s zsh)  "$pkgdir/usr/share/zsh/site-functions/_gh"
}

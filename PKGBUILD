# Maintainer: nihalxkumar <nihalxkumar at gmail dot com>
# https://github.com/nihalxkumar/PKGBUILDs.git

pkgname=github-account-switch-git
_pkgname=gh-switch
pkgver=r55.bdc3962
pkgrel=1
pkgdesc="A fast, reliable cli tool for managing multiple GitHub accounts"
arch=('any')
url="https://github.com/TheDevOpsBlueprint/github-account-switch-cli"
license=('MIT')
depends=('bash' 'git' 'openssh')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/TheDevOpsBlueprint/github-account-switch-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm755 bin/gh-switch-standalone "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  if [ -d completions ]; then
    install -Dm644 completions/gh-switch.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 completions/gh-switch.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  fi
}

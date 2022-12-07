# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=copilot.vim
pkgname=vim-copilot-git
pkgver=r29.2f4f925
pkgrel=1
pkgdesc="(Neo)Vim plugin for GitHub Copilot automated code completion. Requires a subscription."
arch=(any)
url="https://github.com/github/$_pkgname"
license=(custom)
groups=(vim-plugins)
depends=(vim-plugin-runtime nodejs)
makedepends=(git)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find autoload copilot doc lua plugin -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

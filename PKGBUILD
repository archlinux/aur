# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=copilot.vim
pkgname=vim-copilot-git
pkgver=1.49.0.r0.gd1e8429
pkgrel=2
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
  git describe --long --tags --match 'v*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "$_pkgname"

  find autoload copilot-language-server doc lua plugin syntax -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

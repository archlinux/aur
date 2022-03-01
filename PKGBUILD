# Maintainer: Nico <d3sox at protonmail dot com>
_gitname=ohmyzsh
pkgname=zsh-fzf-plugin-git
pkgver=r102605958
pkgrel=2
pkgdesc='Zsh plugin to enable fzf history search (sourced from Oh My Zsh, for use without it)'
arch=('any')
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf"
license=('MIT')
depends=('zsh' 'fzf')
makedepends=('git')
source=("git+https://github.com/ohmyzsh/$_gitname.git")
sha512sums=('SKIP')
provides=('zsh-fzf-plugin')
conflicts=('zsh-fzf-plugin')

pkgver() {
  cd "$srcdir/$_gitname"

  # Get the version number.
  printf "r%s" "$(git rev-parse --short $(git hash-object plugins/fzf/fzf.plugin.zsh))"
}

package() {
  cd "$srcdir/$_gitname"

  _plugindir="$pkgdir/usr/share/zsh/plugins/zsh-fzf-plugin"

  # install plugin
  install -dm 755 "$_plugindir"
  install -Dm 644 plugins/fzf/fzf.plugin.zsh "$_plugindir"

  # install doc
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" plugins/fzf/README.md
  # install license
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}


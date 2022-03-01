# Maintainer: Nico <d3sox at protonmail dot com>
_gitname=ohmyzsh
pkgname=zsh-fzf-plugin-git
pkgver=r6555.511ed6540
pkgrel=1
pkgdesc='Zsh plugin to enable fzf history search (sourced from Oh My Zsh, for use without it)'
arch=('any')
url="https://github.com/ohmyzsh/$_gitname"
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  _plugindir="$pkgdir/usr/share/zsh/plugins/zsh-fzf-plugin"

  # install plugin
  install -dm 755 "$_plugindir"
  install -Dm 644 "plugins/fzf/fzf.plugin.zsh" "$_plugindir"

  # install doc
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  # install license
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}


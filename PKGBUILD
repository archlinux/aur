# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgname=zsh-fzf-git
pkgver=r32.a8a747e18
pkgrel=1
pkgdesc='Zsh plugin to enable fzf history search'
arch=('any')
_gitname=ohmyzsh
url="https://github.com/${_gitname}/${_gitname}.git"
license=('MIT')
depends=('zsh' 'fzf')
makedepends=('git')

source=(git+https://github.com/ohmyzsh/$_gitname.git)

sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"

  # Get the version number.
  printf "r%s.%s" \
    "$(git rev-list --count HEAD "plugins/fzf")" \
    "$(git log --format="%h" --max-count=1 -- "plugins/fzf")"
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

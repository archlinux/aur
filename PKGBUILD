# Maintainer: lmartinez-mirror
pkgname=forgit-git
_pkgname=${pkgname%-git}
pkgver=r273.c57c9f9
pkgrel=1
pkgdesc="Utility tool powered by fzf for using git interactively"
arch=('any')
url="https://github.com/wfxr/forgit"
license=('MIT')
groups=('fish-plugins' 'zsh-plugins')
depends=('bash' 'fzf')
optdepends=('zsh: supported shell'
            'fish: supported shell'
            'delta: human readable diffs'
            'diff-so-fancy: human readable diffs'
            'bat: syntax highlighting for .gitignore'
            'emoji-cli: emoji support for git log')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # zsh install
  install -Dm 644 forgit.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"

  # fish install
  install -Dm 644 conf.d/forgit.plugin.fish "$pkgdir/etc/fish/conf.d/forgit.plugin.fish"

  # docs
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  # license
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

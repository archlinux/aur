# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=zsh-theme-powerlevel10k-git
pkgver=r3806.b9b3399
pkgrel=1
pkgdesc='Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience.'
arch=('any')
url="https://github.com/romkatv/powerlevel10k"
license=('MIT')
depends=('zsh')
makedepends=('git')
optdepends=(
  'ttf-meslo-nerd-font-powerlevel10k: terminal font recommended by powerlevel10k'
  'powerline-fonts: patched fonts for powerline'
  'awesome-terminal-fonts: icon package')
install=zsh-theme-powerlevel10k.install
provides=("zsh-theme-powerlevel10k")
conflicts=("zsh-theme-powerlevel10k")
source=('powerlevel10k::git+https://github.com/romkatv/powerlevel10k.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/powerlevel10k"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/powerlevel10k"
  make pkg
}

package() {
  cd "$srcdir"
  find powerlevel10k -path powerlevel10k/.git -prune \
    -o '(' -type f -exec install -D '{}' "$pkgdir/usr/share/zsh-theme-{}" ';' ')'
}

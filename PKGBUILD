# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras-git
pkgver=20150715
pkgrel=1
pkgdesc="Extra keybindings for fzf"
arch=('any')
depends=('fzf')
makedepends=('git')
optdepends=('ctags: select tags'
            'git: git checkout fuzzy commits, branches'
            'mlocate: locate files'
            'vim-fzf: fzf.vim'
            'xdg-utils: open files'
            'zsh: zsh keybindings')
url="https://github.com/atweiden/fzf-extras"
license=('MIT')
source=(git+https://github.com/atweiden/fzf-extras)
sha256sums=('SKIP')
provides=('fzf-extras')
conflicts=('fzf-extras')
install=fzf-extras.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/fzf-extras/README.md"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh "$pkgdir/etc/profile.d/fzf-extras.zsh"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

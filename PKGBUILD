# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-fzf
pkgver=0.12.0
pkgrel=1
pkgdesc="Fuzzy finder for Vim, inspired by ctrlp.vim and the likes"
arch=('any')
depends=('fzf' 'vim')
groups=('vim-plugins')
url="https://github.com/junegunn/fzf"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/junegunn/${pkgname##vim-}/tar.gz/$pkgver)
sha256sums=('a0754720bda05de1547a50183acec5d8c0515a98be780c2b99d1c1385142b071')
install=vimdoc.install

prepare() {
  cd "$srcdir/${pkgname##vim-}-$pkgver"

  msg2 'Setting fzf-tmux binary location to /usr/bin/fzf-tmux...'
  sed -i "/^let s:fzf_tmux/s@expand.*@'/usr/bin/fzf-tmux'@" plugin/fzf.vim
}

package() {
  cd "$srcdir/${pkgname##vim-}-$pkgver"

  msg2 'Installing docs...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/vim-fzf"

  msg2 'Installing plugin...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership plugin "$pkgdir/usr/share/vim/vimfiles"
}

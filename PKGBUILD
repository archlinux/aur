# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-fzf
pkgver=0.9.13
pkgrel=1
pkgdesc="Fuzzy finder for Vim, inspired by ctrlp.vim and the likes"
arch=('any')
depends=('fzf' 'vim')
groups=('vim-plugins')
url="https://github.com/junegunn/fzf"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/junegunn/${pkgname##vim-}/tar.gz/$pkgver)
sha256sums=('0a9972482f57dddf0d7c72e21d13d664ad9b8ee0535bdaab60bb0db3f0ca14c3')
install=vimdoc.install

prepare() {
  cd "$srcdir/${pkgname##vim-}-$pkgver"

  msg2 'Setting fzf-tmux binary location to /usr/bin/fzf-tmux...'
  sed -i "s@^let s:fzf_tmux = .*@let s:fzf_tmux = '/usr/bin/fzf-tmux'@" plugin/fzf.vim
}

package() {
  cd "$srcdir/${pkgname##vim-}-$pkgver"

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-fzf/README.md"

  msg 'Installing plugin...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership plugin "$pkgdir/usr/share/vim/vimfiles"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

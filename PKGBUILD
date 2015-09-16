# Maintainer: Matthew Gamble
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-pacmanlog
pkgver=1.2
pkgrel=1
pkgdesc="Vim syntax highlighting for Pacman log files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/pacmanlog.vim"
license=('custom:vim')
source=("https://github.com/vim-scripts/pacmanlog.vim/archive/${pkgver}.tar.gz")
sha256sums=('b0fac7971e3b0ceac765ec69ba2b47cefc18fdbb8c04fc7856955dc71b22532e')
conflicts=('vim-pacmanlog-git')
install=vimdoc.install

package() {
  cd "pacmanlog.vim-${pkgver}"

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-pacmanlog/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

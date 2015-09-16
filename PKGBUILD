# Maintainer: Matthew Gamble
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-csv-git
pkgver=20150115
pkgrel=1
pkgdesc="Vim filetype plugin for CSV files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/csv.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/csv.vim)
sha256sums=('SKIP')
provides=('vim-csv')
conflicts=('vim-csv')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-csv/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc ftdetect ftplugin plugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

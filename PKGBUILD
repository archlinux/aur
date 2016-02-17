# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-rainbow-parentheses-git
pkgver=20130304
pkgrel=1
pkgdesc="Better Rainbow Parentheses"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/kien/rainbow_parentheses.vim"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/kien/rainbow_parentheses.vim)
sha256sums=('SKIP')
provides=('vim-rainbow-parentheses')
conflicts=('vim-rainbow-parentheses')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 readme.md "$pkgdir/usr/share/doc/vim-rainbow-parentheses/readme.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

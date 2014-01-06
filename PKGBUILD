# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-eunuch-git
pkgver=v1.0.r5.g6a4d193
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/tpope/vim-eunuch"
license=('custom:vim')
source=(git+https://github.com/tpope/vim-eunuch)
sha256sums=('SKIP')
provides=('vim-eunuch')
conflicts=('vim-eunuch')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  
  msg 'Removing unneeded files...'
  rm -f README.markdown
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

pkgname=vim-salt-git
pkgver=r73.6ca9e35
pkgrel=1
pkgdesc="Vim files for editing Salt files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/saltstack/salt-vim"
license=('MIT')
source=($pkgname::git+https://github.com/saltstack/salt-vim)
sha256sums=('SKIP')
provides=('salt-vim' 'salt-vim-git')
conflicts=('salt-vim' 'salt-vim-git')
install=vimdoc.install

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}

  msg 'Removing stray files...'
  rm README.rst
}

package() {
  cd ${pkgname}

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

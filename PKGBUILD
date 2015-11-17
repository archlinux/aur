# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: anergy <anergy.25110321@gmail.com>
# Maintainer: Leif Warner <abimelech@gmail.com>
_gitname=vimproc
pkgname=vim-vimproc-git
pkgver=ver.9.2.r5.ee10f74
pkgrel=1
pkgdesc="interactive command execution in vim"
arch=(i686 x86_64)
url="https://github.com/Shougo/vimproc"
depends=(vim)
makedepends=('git')
provides=(vim-vimproc)
conflicts=(vim-vimproc)
install=vimdoc.install
source=('git://github.com/Shougo/vimproc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  for f in autoload/vimproc.vim autoload/vimproc/* doc/* plugin/* lib/* ; do
    install -Dm644 $f "${pkgdir}/usr/share/vim/vimfiles/$f"
  done
}

# vim:set ts=2 sw=2 et:

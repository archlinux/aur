# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=vim-jp-ctags
_gitname=ctags
pkgver=0.r823.3c49059
pkgrel=1
pkgdesc="Vim-jp fork of ctags."
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
provides=('ctags')
conflicts=('ctags')
url="https://github.com/vim-jp/ctags"
source=("$_gitname::git+https://github.com/vim-jp/ctags.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  autoheader
  autoconf
  ./configure --prefix=/usr --disable-external-sort
  make
}

package() {
  cd "$srcdir/$_gitname"
  make prefix="$pkgdir/usr" install
}

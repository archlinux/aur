# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=ctags-fishman-git
_gitname=ctags
pkgver=0.r1821.58b6cea
pkgrel=1
pkgdesc="fishman's fork of ctags."
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
provides=('ctags')
conflicts=('ctags')
options=('staticlibs' '!emptydirs')
url="https://github.com/fishman/ctags"
source=("$_gitname::git+https://github.com/fishman/ctags.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  autoreconf -f -i -v
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}

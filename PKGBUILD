# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=20kly-git
pkgver=baba06d
pkgrel=1
pkgdesc="20'000 Light Years Into Space game"
arch=('any')
url="http://www.jwhitham.org/20kly/"
license=('GPL')
depends=('python2-pygame' 'glpk')
conflicts=('20kly')
provides=('20kly')
source=("git+https://github.com/20kly/20kly.git"
        '0001-fix.patch')
md5sums=('SKIP'
         '963cd97ab3b7f962069612e642a3dee5')
_gitname=20kly

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd "$_gitname"
  patch -p1 -i $srcdir/0001-fix.patch
}

package() {
  cd "$_gitname"

  mkdir -p ${pkgdir}/usr/share/20kly
  cp -r audio data code manual lightyears ${pkgdir}/usr/share/20kly

  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/20kly/lightyears ${pkgdir}/usr/bin/20kly
}

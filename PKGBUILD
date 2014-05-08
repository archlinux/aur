#Maintainer: Steve Ponsford <stvnpnsfrd at gmail dot com>

pkgname=bbdock-git
pkgver=07fcb34
pkgrel=1
pkgdesc="An application launcher dockapp supporting PNG files and transparency"
arch=('i686' 'x86_64')
url="https://github.com/markusfisch/bbdock"
license=('LGPL3')
depends=('libx11' 'libpng' 'gcc-libs')
makedepends=('libxt' 'git')
provides=('bbdock')
conflicts=('bbdock')
source=("git://github.com/markusfisch/bbdock.git")
md5sums=('SKIP')
_gitname="bbdock"

pkgver () {
    cd $_gitname
    git describe --always | sed 's|-|.|g' 
}

build() {
  cd $_gitname
  ./configure --prefix=/usr
  make clean || return 1
  make || retrun 1
}
  
package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

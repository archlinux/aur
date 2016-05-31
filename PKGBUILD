# Maintainer: Christian Boxdörfer <christian.boxdoerfer@posteo.de>
pkgname=fsearch-git
_gitname=fsearch
pkgver=2016.05.31
pkgrel=1
pkgdesc="A fast file search utility. Git Version."
arch=('i686' 'x86_64')
url="https://cboxdoerfer.github.io/fsearch"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'gnome-common')
conflicts=('fsearch')
source=('git://github.com/cboxdoerfer/fsearch.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git log -1 --format=%cd --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname/

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname/

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-wm-git
pkgver=1.0.r9.g38916e0
pkgrel=1
epoch=1
pkgdesc="Windowmanagement environment for guile"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
depends=('guile' 'guile-xcb')
makedepends=('git')
provides=('guile-wm')
conflicts=('guile-wm')
source=("git+https://github.com/mwitmer/guile-wm.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="${pkgname%-git}"

pkgver() {
  cd $_gitname
  printf %s $(git describe --tags  | sed 's+-+.r+' | tr  - .)
}

prepare() {
  cd $_gitname
  sed -i 's+2.0 2.2+2.2+' configure.ac
}

build() {
  cd "$_gitname"
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

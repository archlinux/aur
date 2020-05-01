#Maintainer: Fuzzbop <fuzzbop@gmail.com>
pkgname=objfw-git
pkgver=r4924.835441f9
pkgrel=1
pkgdesc="ObjFW is a portable, lightweight framework for the Objective C language."
arch=('i686' 'x86_64')
url="https://objfw.nil.im/"
license=('QPL' 'GPL2' 'GPLv3')
makedepends=('git' 'clang')
source=("git+https://github.com/ObjFW/ObjFW.git")
md5sums=('SKIP')
_pkgname=ObjFW

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}

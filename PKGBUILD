# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=lxrad-git
_gitname=${pkgname%-git}
pkgver=v0.8.r93.g1d5ba7a
pkgrel=2
pkgdesc="linux x11 rad tools"
arch=('x86_64')
url='https://github.com/lcgamboa/lxrad'
license=('GPL2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('doxygen'
             'git'
             'openal'
             'wxgtk2')
source=("git+https://github.com/lcgamboa/lxrad")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"

  sed -i '31s|#include<lxrad/lxrad.h>|#include "../include/lxrad.h"|' layout/layout2.h
}

build() {
  cd "$_gitname"

  autoupdate
  autoreconf --install

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"

  install -dm755 ${pkgdir}/usr/lib \
                ${pkgdir}/usr/bin

  make install prefix="$pkgdir/usr"
}

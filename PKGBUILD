# Maintainer: maz-1 < ohmygod19993 at gmail dot com >

pkgname=pcsx2-plugin-usbqemu-wheel
pkgver=20150906
pkgrel=1
pkgdesc='A USB plugin modified to support steering wheels in pcsx2.'
arch=('i686' 'x86_64')
url='https://github.com/jackun/USBqemu-wheel'
license=('Unlicense')
depends=('pcsx2')
makedepends=('cmake' 'git')
makedepends_x86_64=('gcc-multilib')
options=('!emptydirs')
source=('git+https://github.com/jackun/USBqemu-wheel.git')
sha256sums=('SKIP')

_gitname=USBqemu-wheel

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    cd  "$srcdir/$_gitname"
    mkdir -p build
}

build() {
  cd  "$srcdir/$_gitname"
  cd build
  cmake ../src
  make
}

package() {
  cd "$srcdir/$_gitname"/build
  find -type l | while read line ; do rm $line ; done
  install -dm755 "${pkgdir}"/usr/lib32/pcsx2
  cp libUSBqemu-wheel.so* "${pkgdir}"/usr/lib32/pcsx2/libUSBqemu-wheel.so
}


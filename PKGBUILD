# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=wejoy-git
pkgver=r12.426cb1a
pkgrel=1
pkgdesc="Tool to read physical joystick devices, create virtual joystick devices and output keyboard presses on a Linux system."
arch=('x86_64')
url="https://github.com/Vantskruv/wejoy"
license=('unknown')
depends=('lua52' 'libx11' 'libsystemd')
makedepends=('git')
provides=('wejoy')
source=('git+https://github.com/Vantskruv/wejoy.git')
md5sums=('SKIP')

pkgver() {
  cd wejoy
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/wejoy
  sh make.sh
}

package() {
  cd $pkgdir
  mkdir usr
  mkdir ./usr/bin
  mkdir ./usr/share
  mkdir ./usr/share/wejoy
  cp $srcdir/wejoy/wejoy ./usr/bin/
  cp $srcdir/wejoy/*.lua ./usr/share/wejoy/
  cp $srcdir/wejoy/*.txt ./usr/share/wejoy/
  cp $srcdir/wejoy/*.md ./usr/share/wejoy
}

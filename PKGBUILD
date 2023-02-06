# Maintainer: Robert Gonciarz <gonciarz@gmail.com> 
# all credits for LibreELEC team

pkgbase=libreelec-usb-sd-creator-git
pkgname=('libreelec-usb-sd-creator-git')
_gitname=('usb-sd-creator')
pkgver=r1.d5922e2
pkgrel=1
pkgdesc="A simple GUI for creating LibreELEC USB/SD card installation media"
arch=('i686' 'x86_64')
url="https://github.com/LibreELEC/usb-sd-creator"
license=('GPLv2')
makedepends=('git' 'qt5-tools' 'qt5-base')
source=("git+https://github.com/LibreELEC/usb-sd-creator")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname%-git}"
  lrelease creator.pro
  qmake creator.pro
  make -j4
}

package() {
  cd "${_gitname%-git}"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm755 LibreELEC.USB-SD.Creator.Linux-bit.bin "${pkgdir}"/usr/bin/libreelec-usb-sd-creator
}


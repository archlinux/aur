# Maintainer: Booker <lordbooker@gmail.com>
pkgname=linux-g13-driver-git
pkgver=r1.0.0 
pkgrel=1
pkgdesc="User-space driver and configuration tool for the Logitech G13 gameboard (Modernized Fork)"
arch=('x86_64')
url=https://github.com/Lordbooker/linux-g13-driver.git
license=('GPL') 
depends=('libusb' 'gtk3' 'libappindicator-gtk3' 'jre17-openjdk' 'python-psutil')
makedepends=('git' 'cmake' 'maven' 'jdk17-openjdk')
provides=('linux-g13-driver')
conflicts=('linux-g13-driver' 'g13-driver')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/linux-g13-driver"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  
}

build() {
  cd "$srcdir/linux-g13-driver/g13-driver/src"
 
   make build-driver build-gui

}

package() {
  cd "$srcdir/linux-g13-driver/g13-driver/src"

  make install DESTDIR="$pkgdir" PREFIX=/usr

}

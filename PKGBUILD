# Maintainer: Giulio Fieramoscsa <giulio at glgprograms dot it>
_pkgname=avarice
pkgname=$_pkgname-git
pkgrel=1
pkgver=v2.14.7.r0.g25c3cb2
pkgdesc="AVaRICE is a program for interfacing the Atmel JTAG ICE to GDB to allow users to debug their embedded AVR target."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/avarice/"
license=('GPL')
depends=(libusb-compat)
makedepends=(git)
source=("git+https://github.com/Florin-Popescu/$_pkgname.git")
md5sums=('SKIP')

build() {
  cd $_pkgname
  ./Bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

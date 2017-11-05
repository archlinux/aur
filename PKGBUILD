# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmms-git
pkgver=0.6.4.r6.g03fa0e9
pkgrel=1
pkgdesc="A library for downloading (streaming) media files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/libmms/"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('libmms')
conflicts=('libmms')
options=('staticlibs')
source=("git+https://git.code.sf.net/p/libmms/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^libmms-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
}

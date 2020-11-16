# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=libsocketcan2-git
pkgver=r92.df01f01
pkgrel=2
pkgdesc="Library to control some basic functions in SocketCAN from userspace"
arch=('i686' 'x86_64')
url="http://git.pengutronix.de/?p=tools/libsocketcan.git"
license=('LGPLv2')
#depends=('')
#makedepends=('')
conflicts=('libsocketcan2')
provides=('libsocketcan2')
source=("${pkgname}"'::git+https://git.pengutronix.de/git/tools/libsocketcan')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

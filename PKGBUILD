# Maintainer: Rox Ma <roxma@qq.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dan Serban
# Contributor: Ross Melin <rdmelin@gmail.com>

pkgname=lib32-libfaketime
pkgver=0.9.8
pkgrel=1
pkgdesc='Report fake dates and times to programs without having to change the system-wide time.'
arch=('x86_64')
url='https://github.com/wolfcw/libfaketime'
license=('GPL2')
source=("https://github.com/wolfcw/libfaketime/archive/v$pkgver.tar.gz")
md5sums=('9ad120f0d74d722d83570035b6a507f0')

build() {
  cd "libfaketime-${pkgver}"
  make PREFIX=/usr LIBDIRNAME=/lib32/faketime CC="gcc -m32" CXX="g++ -m32"
}

package() {
  cd "libfaketime-${pkgver}"
  # We don't need to install documentation and binary executable
  # make PREFIX=/usr LIBDIRNAME=/lib32/faketime DESTDIR="${pkgdir}" install
  install -dm0755 ${pkgdir}/usr/lib32/faketime
  install src/libfaketime.so.1 src/libfaketimeMT.so.1 ${pkgdir}/usr/lib32/faketime/
}

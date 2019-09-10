# Maintainer: juantascon <juantascon.aur@horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libtrash
pkgver=3.4
pkgrel=3
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="http://pages.stern.nyu.edu/~marriaga/software/libtrash/"
license=('GPL')
depends=('glibc')
makedepends=('python2')
install=$pkgname.install
source=(http://pages.stern.nyu.edu/~marriaga/software/libtrash/$pkgname-${pkgver}.tgz)
sha256sums=('baf2b83f1b1aa61358c40cb00213dcc400aea984e46120c278c965409eca65b1')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  sed -i -e s/ldconfig// ./src/Makefile
  sed -i -e s/python/python2/ ./src/Makefile

  make INSTLIBDIR=${pkgdir}/usr/lib SYSCONFFILE=${pkgdir}/etc
}

package() {
  install -d ${pkgdir}/usr/lib ${pkgdir}/etc/
  cd ${srcdir}/$pkgname-$pkgver

  make INSTLIBDIR=${pkgdir}/usr/lib SYSCONFFILE=${pkgdir}/etc install
}

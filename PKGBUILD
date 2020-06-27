# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libtrash
pkgver=3.5
pkgrel=1
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="http://pages.stern.nyu.edu/~marriaga/software/libtrash/"
license=('GPL')
depends=('glibc')
makedepends=('python2')
install=$pkgname.install
source=(http://pages.stern.nyu.edu/~marriaga/software/libtrash/$pkgname-${pkgver}.tgz)
sha256sums=('13f40dcade8392ec6a1b095b387c91c1edf7c4e5d79e2b8d0076349a48b57cf9')

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

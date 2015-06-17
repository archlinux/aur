# Maintainer: juantascon <juantascon.aur@horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libtrash
pkgver=3.3
pkgrel=3
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="http://pages.stern.nyu.edu/~marriaga/software/libtrash/"
license=('GPL')
depends=('glibc')
makedepends=('python2')
install=$pkgname.install
source=(http://pages.stern.nyu.edu/~marriaga/software/libtrash/$pkgname-latest.tgz libtrash.sh)
sha256sums=('24b4dcf03afb8feec8c1a95174a74a68c64ea400e9b8957838c62eebdc2c0b86'
            '9eefbca7672300d4c4c053c4ab26ebfb5095d859b8b233f11ed9c1c3e806bab2')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  sed -i -e s/ldconfig// ./src/Makefile
  sed -i -e s/python/python2/ ./src/Makefile

  make INSTLIBDIR=${pkgdir}/usr/lib SYSCONFFILE=${pkgdir}/etc
}

package() {
  install -d ${pkgdir}/usr/lib ${pkgdir}/etc/profile.d
  cd ${srcdir}/$pkgname-$pkgver

  make INSTLIBDIR=${pkgdir}/usr/lib SYSCONFFILE=${pkgdir}/etc install
  install -D -m 644 ${srcdir}/libtrash.sh ${pkgdir}/etc/profile.d/libtrash.sh
}

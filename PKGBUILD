# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=efte
pkgver=1.1
pkgrel=1
pkgdesc="Fast configurable programmers editor"
arch=('i686' 'x86_64')
url="http://efte.sourceforge.net/"
license=('GPL' 'custom')
depends=('libxpm')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f92974f8f438842bae3b837fe6eff099')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  cmake -DBUILD_X=ON \
        -DBUILD_CONSOLE=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

#license file
  install -D -m644 Artistic ${pkgdir}/usr/share/licenses/$pkgname/Artistic || return 1
}

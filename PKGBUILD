# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=uperf
pkgver=1.0.4
pkgrel=1
pkgdesc="A network performance tool that supports modelling and replay of various networking patterns"
arch=('i686' 'x86_64')
url="http://www.uperf.org/"
license=('GPL3')
depends=('lksctp-tools')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver.tar.bz2 
        lpthread.patch)
md5sums=('ccbc52686451c14c5532d7ccd67b699c'
         'bad43924882b7ed98ed429bf365f3375')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -p1 -i ../lpthread.patch
  ./configure --prefix=/usr --datadir=/usr/share/uperf
  make
}


package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}

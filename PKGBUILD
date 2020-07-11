# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=uperf
pkgver=1.0.7
pkgrel=1
pkgdesc="A network performance tool that supports modelling and replay of various networking patterns"
arch=('i686' 'x86_64')
url="http://www.uperf.org/"
license=('GPL3')
depends=('lksctp-tools')
makedepends=('automake' 'patch')
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz
        lpthread.patch)
sha256sums=('fca4358c60c5db93ada1ef387962d669f2531796c6cd6dda702c2a27df3cd09a'
            'b2194ec13cc9ff62195246390a18200527fd842f97b53e2af6e6da21aad5e4d1')

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

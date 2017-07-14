# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=uperf
pkgver=1.0.5
pkgrel=1
pkgdesc="A network performance tool that supports modelling and replay of various networking patterns"
arch=('i686' 'x86_64')
url="http://www.uperf.org/"
license=('GPL3')
depends=('lksctp-tools')
makedepends=('git' 'automake' 'patch')
source=(git+https://github.com/uperf/uperf.git#commit=9a22199e2197d9a3f8c474a91e1dfa7285a09e1b
        lpthread.patch)
sha256sums=('SKIP'
            'b2194ec13cc9ff62195246390a18200527fd842f97b53e2af6e6da21aad5e4d1')

build() {
  cd "${srcdir}"/$pkgname

  patch -p1 -i ../lpthread.patch
  ./configure --prefix=/usr --datadir=/usr/share/uperf
  make
}


package() {
  cd "${srcdir}"/$pkgname

  make DESTDIR="${pkgdir}" install
}

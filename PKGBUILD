# Maintainer: Max Lübke <maxluebke(at)gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.45
pkgrel=1
pkgdesc="Security-aware parser for the HTTP protocol and the related bits and pieces."
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('custom')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('d4214f94522fa5a1ec1909dbb52831c534788d93bc6b2ca8252de9332b11b606')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

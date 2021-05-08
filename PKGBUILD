# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=dnstracer
pkgver=1.10
pkgrel=1
pkgdesc='Determines where a given DNS server gets its information from, and follows the chain of DNS servers'
url='https://www.mavetju.org/unix/dnstracer.php'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc')
source=("https://www.mavetju.org/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('64cda0ed15ef598a38ec72a96a356e3d10b7f822fc75928115eae96a65ae2b21')

build() {
  cd ${pkgname}
  make PREFIX=/usr CC="gcc ${CFLAGS} ${LDFLAGS}"
}

package() {
  cd ${pkgname}
  mkdir -p "$pkgdir"/usr/{bin,share/man/man8}
  make PREFIX="$pkgdir"/usr MANPREFIX="$pkgdir"/usr/share/man/man8 install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/dnstracer/LICENSE
}

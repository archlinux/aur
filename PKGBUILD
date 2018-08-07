# Maintainer: Dmitrii Tcvetkov <demfloro@demfloro.ru>

pkgname=aggregate
pkgver=1.6
pkgrel=1
pkgdesc="Tool for aggregating CIDR IPv4 networks"
url="https://ftp.isc.org/isc/aggregate/"
arch=('i686' 'x86_64')
license=('MIT')
source=(https://ftp.isc.org/isc/aggregate/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  sh ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/man/man1" "${pkgdir}/usr/share/man" "${pkgdir}/usr/share/licenses/aggregate"
  make prefix="${pkgdir}/usr" install

  mv "${pkgdir}/usr/man/man1" "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/man"
  install -m 0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/aggregate"
}
sha256sums=('166503005cd8722c730e530cc90652ddfa198a25624914c65dffc3eb87ba5482')

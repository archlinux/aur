# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mmucl
pkgver=1.5.2
pkgrel=2
pkgdesc="MUD client programmed in tcl"
arch=('i686' 'x86_64')
url="http://mmucl.sourceforge.net/"
license=('GPL2')
depends=('tcl')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d38ad0b1a51325dada8ac6b1b15113e2')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i "s|/usr/local|${pkgdir}/usr|" Makefile
  grep -v "/mmucl.info" Makefile &> Makefile2
  mv Makefile2 Makefile
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/mmucl

  make install

  install -Dm644 "${srcdir}"/$pkgname-$pkgver/mmucl.html "${pkgdir}"/usr/share/mmucl/
  sed -i "s|${pkgdir}||" "${pkgdir}"/usr/bin/mmucl2
}

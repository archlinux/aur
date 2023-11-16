pkgname=systemc-ams
pkgver=2.3.4
pkgrel=1
pkgdesc="SystemC-AMS is an Analog and Mixed-Signal extension library for SystemC"
url="http://www.accellera.org/activities/working-groups/systemc-ams"
arch=('x86_64' 'i686')
license=('Apache License Version 2.0, January 2004')
depends=('systemc')
optdepends=()
makedepends=('tar')
conflicts=()
provides=('systemc-ams')
source=("https://www.coseda-tech.com/files/Files/Proof-of-Concepts/systemc-ams-${pkgver}.tar.gz")
md5sums=('275f76c34878b85192d295eebc22e4b0')

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
    tar -xf ${pkgname}-${pkgver}.tar.gz
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=${pkgdir}/usr --with-layout=unix --with-systemc=/usr
  make -j $(getconf _NPROCESSORS_ONLN)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for file in NOTICE AUTHORS README NEWS RELEASENOTES; do
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" $file
  done
}

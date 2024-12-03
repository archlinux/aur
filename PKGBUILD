pkgname=tcptrack
pkgver=1.4.3
pkgrel=2
pkgdesc="A sniffer which displays information about TCP connections it sees on a network interface"
arch=('i686' "x86_64")
url="https://github.com/bchretien/tcptrack"
license=('GPL')
depends=('libpcap')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8725205ecbeddc3f891e3345e70f150d87705b099eafd8780f4739ab14f8c862')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  sed -i 's/%ds/%zus/' src/TextUI.cc
  sed -i 's/%dm/%zum/' src/TextUI.cc
  sed -i 's/%dh/%zuh/' src/TextUI.cc
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# Maintainer: baderas <development+aur(at)geekparadise.de>
pkgname=x4daemon
pkgver=0.4.5
pkgrel=1
pkgdesc="A daemon that makes it possible to use all special keys on your Sidewinder X4 keyboard."
arch=('i686' 'x86_64')
url="https://github.com/baderas/x4daemon"
license=('GPL')
depends=('libusb>=1.0.8' 'bash' 'grep' 'coreutils' 'procps')
makedepends=('autoconf')
source=("https://github.com/baderas/${pkgname}/archive/${pkgver}.tar.gz" "${pkgname}.install")
install="${pkgname}.install"
sha256sums=('c3aa2adebd2f4fa28e262d305b86f1637a54f28f29c2c0773029bb4956e484ab'
            '9a0c434fdd245057383276415b10c38be7452c00a42a190f606861ce2b063c18')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoconf
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/src/x4daemon.service" "${pkgdir}/usr/lib/systemd/system/x4daemon.service"
}

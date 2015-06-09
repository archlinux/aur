# Maintainer: Evilandi666 <evilandi.aur(at)googlemail.com>
pkgname=x4daemon
pkgver=0.4.4
pkgrel=1
pkgdesc="A daemon that makes it possible to use all special keys on your Sidewinder X4 keyboard."
arch=('i686' 'x86_64')
url="http://www.geekparadise.de/x4daemon/"
license=('GPL')
depends=('libusb>=1.0.8' 'bash' 'grep' 'coreutils' 'procps')
makedepends=('autoconf')
source=("http://geekparadise.de/x4daemon_download/${pkgname}-${pkgver}.tar.bz2" "${pkgname}.install")
install="${pkgname}.install"
sha256sums=('016f7ebfea90383b0a8e5218b9ca829b1fd715cd34a633c3a043fb0fe6fdf834'
            '38205247e8097bce66d4a25c8dbdd7b82d7bef6894979cffb26a231685ec5623')

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

  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/src/x4daemon.init" "${pkgdir}/etc/rc.d/x4daemon"
  
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/src/x4daemon.service" "${pkgdir}/usr/lib/systemd/system/x4daemon.service"
}

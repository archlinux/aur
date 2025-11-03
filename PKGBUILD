# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=opennds
pkgver=10.3.1
pkgrel=1
pkgdesc="High performance, small footprint, Captive Portal."
arch=(x86_64)
url="https://github.com/openNDS/openNDS"
license=(GPL-2.0-only)
depends=('libmicrohttpd')
source=("https://github.com/openNDS/openNDS/archive/refs/tags/v$pkgver.tar.gz"
        "001-systemd-service-location.patch")
sha256sums=('f82fe0fa2e4e8ab66abf33cae7cb20e79661c8a183af82eefa11307e9c66968d'
            '745e136db36da89cb2875c394c073b6e1c762f57bcfd2c4353b7baeee9784a5d')

prepare() {
  cd openNDS-$pkgver
  patch -Np1 -i ../001-systemd-service-location.patch
}

build() {
  cd openNDS-$pkgver
  make
}

package() {
  cd openNDS-$pkgver
  make install DESTDIR="${pkgdir}" SYSCONFDIR="/etc"
}


# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=opennds
pkgver=11.0.0
pkgrel=1
pkgdesc="High performance, small footprint, Captive Portal."
arch=(x86_64)
url="https://github.com/openNDS/openNDS"
license=(GPL-2.0-only)
depends=('libmicrohttpd')
source=("https://github.com/openNDS/openNDS/archive/refs/tags/v$pkgver.tar.gz"
        "001-systemd-service-location.patch")
sha256sums=('33940f8ef52e958cdf37fd49ca20a8140b85a096d529cf4e0122592ac24ced00'
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


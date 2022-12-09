# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=otpclient
_pkgname=OTPClient
pkgver=3.0.0
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3>=3.22' 'jansson>=2.10' 'libzip' 'libcotp' 'zbar>=0.20' 'protobuf>=3.6' 'protobuf-c>=1.3.0')
makedepends=('cmake')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('0e2c35038094c0180d7f6cee9877fdb017fad7c95871cdb93f799b80dc14ceec'
            'SKIP')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DSHARE_INSTALL_PREFIX:PATH=/usr/share
  make
}

package() {
  cd "$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Paolo Stivanin <info@paolostivanin.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=otpclient
_pkgname=OTPClient
pkgver=3.7.0
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3>=3.24' 'jansson>=2.12' 'libcotp>=3.0.0' 'zbar>=0.20' 'protobuf>=3.6' 'protobuf-c>=1.3.0' 'qrencode>4.0.2')
makedepends=('cmake')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('d42a5044d50a74bace82b0e5ced22d7aa41be4d4ac37aff01fa53774a7fbb7db'
            'SKIP')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build && cd build
  cmake \
    -S.. \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DSHARE_INSTALL_PREFIX:PATH=/usr/share
  cmake --build . --target all
}

package() {
  cd "$_pkgname-$pkgver/build"
  cmake --install . --prefix="$pkgdir/usr"
}

# Maintainer: Paolo Stivanin <info@paolostivanin.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=otpclient
_pkgname=OTPClient
pkgver=3.1.6
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3>=3.22' 'jansson>=2.12' 'libzip' 'libcotp>=2.0.0' 'zbar>=0.20' 'protobuf>=3.6' 'protobuf-c>=1.3.0' 'qrencode>4.0.1')
makedepends=('cmake')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('ef82c0ec51ad1f9f108a1b0e919e128d8f6e07852cec3f919ba25aace266de94'
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

# Maintainer: Paolo Stivanin <info@paolostivanin.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=otpclient
_pkgname=OTPClient
pkgver=5.1.3
pkgrel=1
pkgdesc="A simple GTK4 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk4>=4.10' 'jansson>=2.13' 'libcotp>=4.0.0' 'zbar>=0.20' 'protobuf-c>=1.3.0' 'qrencode>=4.0.0', 'libadwaita>=1.5.0', 'libsecret>=0.20.0', 'libgcrypt>=1.10.1')
makedepends=('cmake')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('2027d760599e75572d1d297a1bff2f2e7f26534b376d5e287a6fa4d921383f0c'
            'SKIP')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build && cd build
  cmake \
    -S.. \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
    -DENABLE_MINIMIZE_TO_TRAY=ON
  cmake --build . --target all
}

package() {
  cd "$_pkgname-$pkgver/build"
  cmake --install . --prefix="$pkgdir/usr"
}

# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=otpclient
_pkgname=OTPClient
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3>=3.22' 'jansson' 'libzip' 'libcotp' 'zbar>=0.20')
makedepends=('cmake')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('c7a7e96675b4552b26e6d47372a8f4bc6dbb18834161d85a3aecf3beab4ef7e6'
            'SKIP')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

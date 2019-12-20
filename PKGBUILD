# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=otpclient
_pkgname=OTPClient
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3>=3.22' 'glib2>=2.50' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'libpng' 'zbar>=0.20')
makedepends=('cmake' 'git')
provides=(otpclient)
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$url/archive/v$pkgver.tar.gz" 
	"$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('51086c6e8599d1fae80158406dfd35edd538359f8a7c569692bd864e2549bf0e'
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

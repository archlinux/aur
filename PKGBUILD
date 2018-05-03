# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient-git
_dirname=OTPClient
pkgver=v1.2.0.r4.3ca48f2
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'libpng' 'zbar')
makedepends=('cmake' 'git')
conflicts=(otpclient)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_dirname"
 	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake "$_dirname"/ -DCMAKE_INSTALL_PREFIX:PATH=/usr 
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}

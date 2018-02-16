# Maintainer: KingofToasters <themanhimself@sgregoratto.me>

pkgname=otpclient-git
_dirname="OTPClient"
pkgver=v1.1.0.r0.457122e
pkgrel=1
pkgdesc="Simple GTK+ v3 TOTP/HOTP client that uses libcotp"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'pkg-config')
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

# Maintainer: Rowan Lewis <rl@nbsp.io>

_gitname=xdebug
pkgname=php7-xdebug-git
pkgver=r3599.fa686b3
pkgrel=1
pkgdesc="PHP debugging extension (for php7)"
arch=('i686' 'x86_64')
url="https://github.com/derickr/xdebug"
license=('GPL')
depends=('php7')
backup=('etc/php/conf.d/xdebug.ini')
conflicts=('xdebug')
provides=('xdebug')
source=(
	"git+https://github.com/derickr/xdebug.git"
	'xdebug.ini'
)
md5sums=(
	'SKIP'
	'6a1f2ef91c632d4c9b7b218cd2e278ef'
)

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	phpize
	./configure --prefix=/usr --enable-xdebug
	make
}

package() {
	local PHPVER=`php -r 'echo phpversion();'`

	cd "$srcdir/$_gitname"
	make INSTALL_ROOT=$pkgdir install
	install -D -m 644 $srcdir/xdebug.ini $pkgdir/etc/php/conf.d/xdebug.ini
}

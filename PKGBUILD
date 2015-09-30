# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-lua-git
pkgver=1.0.r3.gca5e6fc
pkgrel=1
pkgdesc="Lua plugin for scripts"
arch=('i686' 'x86_64')
url='https://github.com/mniip/hexchat-lua'
license=('MIT')
depends=('lua' 'hexchat')
makedepends=('git')
source=('git+https://github.com/mniip/hexchat-lua.git')
md5sums=('SKIP')
_gitname='hexchat-lua'

pkgver() {
	cd "$_gitname"

	git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
	cd "$srcdir/$_gitname"

	make
}

package() {
	cd "$srcdir/$_gitname"

	DESTDIR=$pkgdir make install
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


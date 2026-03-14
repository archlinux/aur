# Maintainer: labricecat <labricecat@duck.com>

pkgname='lrc-lrc-git'
pkgver=r64.aa604c2
pkgrel=1
pkgdesc="Labricecat Relay Chat"
arch=('x86_64')
url="https://codeberg.org/labricecat/lrcclient"
license=('Apache-2.0')
depends=('glibc' 'lrc-socat' 'lrc-ricetp' 'ncurses' 'lua')
makedepends=('git')
provides=('lrc')
conflicts=('lrc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "lrcclient"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "lrcclient"
	make
}

package() {
	cd "lrcclient"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm755 build/lrc "$pkgdir/usr/bin/lrc" 
	
    install -Dm644 src/*.h -t "$pkgdir/usr/include/lrc"
    install -Dm644 src/api/*.h -t "$pkgdir/usr/include/lrc/api"
}

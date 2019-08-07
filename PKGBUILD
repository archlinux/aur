# Author wizbright
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.0.1
pkgrel=1
pkgdesc='An openbox clone on Wayland (WP)'
license=('MIT')
source=("$pkgname::git+https://github.com/wizbright/waybox.git" "Makefile")
md5sums=('SKIP' 'ae4c2c8642d0abe7af9b511b746ad9c8')
arch=('x86_64')
makedepends=('gcc' 'git')
depends=('wlroots' 'wayland' 'pixman')

prepare() {
	cd "$srcdir"
	cp Makefile waybox/
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$pkgdir"
	cp "$srcdir/$pkgname/waybox_binary" $pkgname
	cp "$srcdir/$pkgname/LICENSE" LICENSE
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname
	install -m 755 $pkgname $pkgdir/usr/bin/
	install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}


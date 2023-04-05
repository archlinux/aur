# Maintainer: aksr <aksr at t-com dot me>
pkgname=foo-wm-git
pkgver=r272.a9df24b
pkgrel=1
pkgdesc='A minimal window manager that organizes windows in a tree data structure, provides a socket to send commands to.'
arch=('i686' 'x86_64')
url="https://github.com/mil/foo-wm"
license=('custom:MIT')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/CC=gcc/& -fcommon/' Makefile
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 foo-wm $pkgdir/usr/bin/foo-wm
	install -Dm755 foo-wm-c $pkgdir/usr/bin/foo-wm-c
	install -Dm755 config/writefifo $pkgdir/usr/share/doc/$_pkgname/config/writefifo
	install -Dm644 config/commands $pkgdir/usr/share/doc/$_pkgname/config/commands
	install -Dm644 scripts/client.rb $pkgdir/usr/share/doc/$_pkgname/scripts/client.rb
	install -Dm644 scripts/marks.rb $pkgdir/usr/share/doc/$_pkgname/scripts/marks.rb
	install -Dm644 scripts/uncontainerize.rb $pkgdir/usr/share/doc/$_pkgname/scripts/uncontainerize.rb
	install -Dm644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

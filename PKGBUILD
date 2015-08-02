# Maintainer: spider-mario <spidermario@free.fr>
pkgname=vala-build-tool-git
pkgver=0.3
pkgrel=1
pkgdesc="A simple tool to help compile Vala applications"
arch=('i686' 'x86_64')
url="https://github.com/EdgeOwl/Vala-Build-Tool"
license=('MIT')
depends=('vala' 'json-glib' 'libgee06')
makedepends=('git')
provides=('vala-build-tool')
conflicts=('vala-build-tool')
source=('vbt::git+https://github.com/EdgeOwl/Vala-Build-Tool.git'
        'LICENSE')
sha512sums=('SKIP'
            '66cc791cbcea79eef617c4ff2a9408727380eb245a84893b6ddeb5f6f84370abf43d1b93e9f17edcffafabd885c2f5a24bebcbb47ccc04da54c58779189a9230')

pkgver() {
	cd vbt
	echo -n 0.
	git rev-list --count HEAD
}

build() {
	cd vbt
	./build.sh
}

package() {
	cd vbt
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm755 vbt "$pkgdir"/usr/bin/vbt
}

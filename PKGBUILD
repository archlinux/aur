# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=elementary-planner
pkgver=2.4.6
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://planner-todo.web.app"
license=('GPL3')
depends=('libsoup' 'granite' 'webkit2gtk' 'evolution-data-server')
optdepends=('gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala')
conflicts=('elementary-planner-git')
source=('https://github.com/alainm23/planner/archive/2.4.6.tar.gz')
sha256sums=('c8384a3940f1ccab50e98846983c4b1b8400ba91520b5106370c35307eceea09')

build() {
	cd planner-$pkgver
	meson build --prefix=/usr
	cd build
	ninja
}

package() {
	cd planner-$pkgver/build
	DESTDIR="$pkgdir" ninja install

	ln -s /usr/bin/com.github.alainm23.planner "$pkgdir/usr/bin/planner"
}

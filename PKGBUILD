# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=elementary-planner
pkgver=2.5.7
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://planner-todo.web.app"
license=('GPL3')
depends=('libsoup' 'granite' 'webkit2gtk' 'evolution-data-server' 'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala')
conflicts=('elementary-planner-git')
source=('https://github.com/alainm23/planner/archive/2.5.7.tar.gz')
sha256sums=('57076a742f6d08fac8bbfe4bf9ed3686d9138d5e41a41c19de3702202278796a')

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

# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=elementary-planner
pkgver=2.5.4
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://planner-todo.web.app"
license=('GPL3')
depends=('libsoup' 'granite' 'webkit2gtk' 'evolution-data-server' 'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala')
conflicts=('elementary-planner-git')
source=('https://github.com/alainm23/planner/archive/2.5.4.tar.gz')
sha256sums=('fa2eb3f4e9c283f08095555914536ee82033b93de5f610ed1ff319a0b0abaac7')

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

# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=elementary-planner
pkgver=2.6.6
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://planner-todo.web.app"
license=('GPL3')
depends=('libsoup' 'granite' 'webkit2gtk' 'evolution-data-server' 'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala')
conflicts=('elementary-planner-git')
source=("https://github.com/alainm23/planner/archive/$pkgver.tar.gz")
sha256sums=('d4c51ec667fd3a5ca7bd06fe156d5894c986f6d25c07b869f3901a25bfd7b731')

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

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jonas 'cherti' Große Sundrup <aur@letopolis.de>
pkgname=elementary-planner
pkgver=2.6.8
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://useplanner.com"
license=('GPL3')
depends=('libsoup' 'granite' 'webkit2gtk' 'evolution-data-server'
         'libpeas' 'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('meson' 'vala' 'gobject-introspection')
provides=('planner')
conflicts=('planner')
source=("planner-$pkgver.tar.gz::https://github.com/alainm23/planner/archive/$pkgver.tar.gz")
sha256sums=('2b2e466257da31105e7e0b7676d1a4e10d384c6461d44472ca49b5e36d587980')

build() {
	arch-meson planner-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/com.github.alainm23.planner "$pkgdir/usr/bin/planner"
}

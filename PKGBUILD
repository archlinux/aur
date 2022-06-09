#!/usr/bin/env bash
# shellcheck disable=SC2164

# Maintainer: Cezary Drożak <cezary at drozak.net>
# Contributor: Zephyr
# Contributor: vitamin1980 <vitamin.novgorod @ yandex.ru>

# shellcheck disable=SC2034
_gitname="oxygen-gtk"
pkgname=oxygen-gtk3-git
pkgver=1.4.1.r12.g705b755f
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK3"
arch=('i686' 'x86_64')
url="https://invent.kde.org/plasma/oxygen-gtk"
license=('LGPL')
depends=('gtk3' 'dbus-glib')
makedepends=('git' 'cmake')
conflicts=('oxygen-gtk3')
provides=('oxygen-gtk3')
options=('!strip')
source=("git+https://invent.kde.org/plasma/$_gitname.git#branch=gtk3")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"

	git describe --long | sed 's/vgtk3-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"

	cmake \
		-B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	cd "$_gitname"

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}

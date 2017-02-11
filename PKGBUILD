# Maintainer: Piotr Szegda piotrszegda at gmail.com

pkgname=xdg-desktop-portal-kde-git
_pkgname=xdg-desktop-portal-kde
pkgver=20161222.94fc1af
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal that is using Qt/KDE.'
url='https://github.com/KDE/xdg-desktop-portal-kde'
license=('GPL')
arch=('x86_64')
makedepends=('git' 'cmake' 'extra-cmake-modules')
depends=('flatpak' 'xdg-desktop-portal')
source=('git://github.com/KDE/xdg-desktop-portal-kde.git')
sha1sums=('SKIP')
conflicts=('xdg-desktop-portal-kde')
provides=('xdg-desktop-portal-kde')
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"

}

build() {
 mkdir xdg-desktop-portal-kde/build && cd xdg-desktop-portal-kde/build
 cd xdg-desktop-portal-kde/build & cmake --prefix=/usr --libexec=/usr/lib  .. 
 make
}

package() {
    cd xdg-desktop-portal-kde/build
	make DESTDIR="$pkgdir/" install
}
 

# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform-git
pkgver=0.7.0.r28.g7790df2
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings as possible"
arch=('i686' 'x86_64')
url="https://github.com/FedoraQt/QGnomePlatform"
license=('LGPL2.1')
depends=('gtk3' 'qt5-wayland' 'adwaita-qt-git')
makedepends=('cmake' 'git')
provides=('qgnomeplatform')
conflicts=('qgnomeplatform')
source=('git+https://github.com/FedoraQt/QGnomePlatform.git')
md5sums=('SKIP')

pkgver() {
	cd QGnomePlatform
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir"/QGnomePlatform
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}

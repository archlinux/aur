# Maintainer: Leo Verto <leotheverto+aur@gmail.com>

pkgname=qlcplus-git
_pkgname=qlcplus
pkgver=4.12.1.r126.g50b228e64
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('i686' 'x86_64')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils')
makedepends=('git' 'qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${pkgname}.install
source=('git+https://github.com/mcallegari/qlcplus.git')
sha1sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname}"
	
	# Remove 'QLC+_' prefix from git tag
	git describe --long --tags | sed 's/^QLC+_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgname}"
	
}

build() {
	cd "$srcdir/${_pkgname}"
	
	qmake-qt5 FORCECONFIG=release
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT="$pkgdir/" install
}

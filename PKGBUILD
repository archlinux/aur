# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
_name=nickvision-application
pkgname=$_name-git
pkgver=2022.5.0.r0.0261fcc
pkgrel=1
pkgdesc="A template for creating Nickvision applications"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionApplication"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp)
makedepends=(git cmake)
provides=($_name)
conflicts=($_name)
source=("git+https://github.com/nlogozzo/NickvisionApplication.git")
md5sums=("SKIP")

prepare() {
	mkdir -p build
    cd $srcdir/NickvisionApplication
    git submodule init
    git submodule update
}

build() {
	cd build
    cmake $srcdir/NickvisionApplication \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
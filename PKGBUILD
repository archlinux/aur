# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-application-git
pkgver=2022.5.0.r2
pkgrel=1
pkgdesc="A template for creating Nickvision applications"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionApplication"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp)
makedepends=(git cmake)
source=("git+https://github.com/nlogozzo/NickvisionApplication.git"
        "git+https://github.com/Makman2/GCR_CMake.git")
sha256sums=("SKIP"
            "SKIP")

prepare() {
	mkdir -p build
    cd $srcdir/NickvisionApplication
    git submodule init
    git config submodule.GCR_CMake.url "${srcdir}/GCR_CMake"
    git submodule update
}

build() {
	cd build
    cmake $srcdir/NickvisionApplication \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
    sudo gtk-update-icon-cache -f /usr/share/icons/hicolor
}
# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-application-git
pkgver=2022.6.0.r3
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
	cd "$srcdir/NickvisionApplication"
    git submodule init
    git config submodule.GCR_CMake.url "${srcdir}/GCR_CMake"
    git submodule update
}

build() {
	cmake -B build -S NickvisionApplication \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE="RelWithDebInfo"
    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
    ln -s /usr/bin/org.nickvision.tagger "${pkgdir}/usr/bin/${pkgname}"
}
# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-tagger
pkgver=2022.5.5
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionTagger"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp taglib libmusicbrainz5)
makedepends=(git cmake)
source=("git+https://github.com/nlogozzo/NickvisionTagger.git#tag=${pkgver}"
        "git+https://github.com/Makman2/GCR_CMake.git")
sha256sums=("SKIP"
            "SKIP")

prepare() {
    mkdir -p build
    cd $srcdir/NickvisionTagger
    git submodule init
    git config submodule.GCR_CMake.url "${srcdir}/GCR_CMake"
    git submodule update
}

build() {
	cd build
    cmake $srcdir/NickvisionTagger \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
    sudo gtk-update-icon-cache -f /usr/share/icons/hicolor
}
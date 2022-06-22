# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-tagger
pkgver=2022.6.3
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
    cd "$srcdir/NickvisionTagger"
    git submodule init
    git config submodule.GCR_CMake.url "${srcdir}/GCR_CMake"
    git submodule update
}

build() {
    cmake -B build -S NickvisionTagger \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE="RelWithDebInfo"
    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
    ln -s /usr/bin/org.nickvision.tagger "${pkgdir}/usr/bin/${pkgname}"
}
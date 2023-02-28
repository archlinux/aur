# Maintainer: EP <epcollabs at outlook dot com>

pkgname=crengine-ng-git
pkgver=0.9.7.r6.0914f4b12
pkgrel=1
pkgdesc='Cross-platform library designed to implement text viewers and e-book readers'
arch=(x86_64)
url=https://gitlab.com/coolreader-ng/crengine-ng
license=(GPL)
depends=(zlib libpng libjpeg-turbo freetype2 harfbuzz fribidi libunibreak zstd libutf8proc fontconfig)
makedepends=(git cmake)
provides=(crengine-ng)
conflicts=(crengine-ng)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/crengine-ng"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cmake -B build -S crengine-ng -Wno-dev \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCRE_BUILD_SHARED=ON \
        -DCRE_BUILD_STATIC=OFF \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
}

# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=turbo-button-git
pkgver=r3.2b98e03
pkgrel=1
pkgdesc="Simple tray app to toggle performance/power preference"
arch=(i686 x86_64)
url="https://github.com/sandsmark/turbo-button"
license=(GPL3)
depends=(qt5-base)
makedepends=(git cmake)
provides=(turbo-button)
conflicts=(turbo-button)
source=('git+https://github.com/sandsmark/turbo-button.git')
md5sums=('SKIP')

pkgver() {
    cd turbo-button
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../turbo-button \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}

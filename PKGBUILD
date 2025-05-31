# Maintainer: Dark-Kernel <sumitpatel24389@gmail.com>
pkgname=tuisic-git
pkgver=1.1.1.r44.6087f0d
pkgrel=1
pkgdesc="The very first of its kind terminal based online music streaming player"
arch=('x86_64')
url="https://github.com/Dark-Kernel/tuisic"
license=('MIT')
depends=('mpv' 'curl' 'fmt' 'yt-dlp' 'fftw' 'sdbus-cpp' 'rapidjson')
makedepends=('cmake' 'git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Dark-Kernel/tuisic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "1.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build
}

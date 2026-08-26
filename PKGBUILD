# Maintainer: WaiRo <wairo at cock dot li>
_pkgname="vibra"
pkgname="$_pkgname-git"
pkgver=0.1.0.r4.g7f3cd2d
pkgrel=1
pkgdesc="A library and CLI tool for music recognition using the unofficial Shazam API"

arch=("x86_64" "aarch64")
url="https://github.com/BayernMuller/$_pkgname"
license=("GPL-3.0-only")

depends=(
    "fftw"
    "curl"
    "glibc"
    "gcc-libs"
)
makedepends=(
    "git"
    "cmake"
    "bc"
    "jq"
    "ffmpeg"
)
optdepends=(
    "ffmpeg: support for audio formats other than WAV"
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}

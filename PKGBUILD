# Maintainer: FoxMoss <foxmoss@mediaology.com>
pkgname=dote-wm
pkgver=0.0.2
pkgrel=1
pkgdesc="A window manager framework for web technology"
arch=('x86_64')
url="https://github.com/FoxMoss/DoteWM/"
license=('BSD')
depends=(
    'gcc-libs'
    'libx11'
    'libxext'
    'libxcomposite'
    'libxfixes'
    'libxi'
    'mesa'           # Provides libGL, libGLU
    'glew'
    'nanomsg'
    'protobuf'
    'abseil-cpp'
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
    'nlohmann-json'
)
makedepends=(
    'cmake'
    'git'
    'python'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoxMoss/DoteWM/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset CPPFLAGS
    unset LDFLAGS

    cmake -B build -S "DoteWM-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

post_install() {
    echo "Setting SUID permissions on chrome-sandbox..."
    chown root:root /usr/bin/dote-browser/chrome-sandbox
    chmod 4755 /usr/bin/dote-browser/chrome-sandbox
}

post_upgrade() {
    post_install
}

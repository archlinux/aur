# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>
pkgname=pangolin-git
pkgver=2017.10.07
pkgrel=2
pkgdesc="Pangolin is a lightweight portable rapid development library for managing OpenGL display / interaction and abstracting video input."
arch=(x86_64)
url="https://github.com/stevenlovegrove/Pangolin"
license=('MIT')
groups=()
depends=(
    'glew'
    'python'
)
optdepends=(
    'cuda'
    'eigen'
    'ffmpeg'
    'libdc1394'
    'libjpeg-turbo'
    'libpng'
    'libtiff'
    'libuvc'
    'openexr'
    'openni2'
    # OpenNI/OpenNI2
    # DepthSense SDK
)
makedepends=('cmake' 'doxygen' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
    'LICENSE'
    'pangolin::git+https://github.com/stevenlovegrove/Pangolin.git'
)
noextract=()
md5sums=('4e1a0885cb682d59abd660ae471481aa' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_PREFIX_PATH=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    cmake --build .
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

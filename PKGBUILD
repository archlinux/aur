# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>
pkgname=pangolin-git
_name=${pkgname%-git}
pkgver=r1736.b6cecf4e
pkgrel=1
pkgdesc='Pangolin is a lightweight portable rapid development library for managing OpenGL display / interaction and abstracting video input.'
arch=(x86_64)
url='https://github.com/stevenlovegrove/Pangolin'
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
provides=("$_name")
conflicts=("$_name")
replaces=()
backup=()
options=()
install=
source=(
    'LICENSE'
    'pangolin::git+https://github.com/stevenlovegrove/Pangolin.git'
)
noextract=()
sha256sums=('fe25815547bcad7ff6d9ab12a381f64c0ef57e9fbb06cb831e9becdd22fde7c7'
            'SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/"$_name"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_PREFIX_PATH=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    cmake --build .
}

package() {
    cd "$srcdir"/"$_name"/build
    make DESTDIR="$pkgdir"/ install
    install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# Maintainer: Mario T <admin@muffinmar.io>
pkgname=quadcast2srgb
pkgver=0.1.0
pkgrel=3
pkgdesc="Customizable RGB LED controller for HyperX Quadcast 2S"
arch=('x86_64')
url="https://github.com/MuffinMario/quadcast2Srgb"
license=('MIT')
depends=('hidapi' 'libsystemd')
makedepends=('cmake' 'gcc' 'pkgconf' 'tomlplusplus' 'git')
backup=("etc/quadcast2srgb/config.toml")
install=quadcast2srgb.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MuffinMario/quadcast2Srgb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06720f9605da86d25f9ba525442a64767db8ca57b9ef3fb7cd86790958e5cc93')  

build() {
    # build the project, striaght forward
    cmake -B build -S "quadcast2Srgb-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEMD=ON \
    -DENABLE_CLANG_TIDY=OFF # no need we don't dev..

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
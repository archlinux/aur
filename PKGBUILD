# Maintainer: Mario T <admin@muffinmar.io>
pkgname=quadcast2srgb
pkgver=0.3.0
pkgrel=1
pkgdesc="Customizable RGB LED controller for HyperX Quadcast 2S"
arch=('x86_64')
url="https://github.com/MuffinMario/quadcast2Srgb"
license=('MIT')
depends=('hidapi' 'libsystemd' 'mesa')
makedepends=('cmake' 'gcc' 'pkgconf' 'tomlplusplus' 'git')
backup=("etc/quadcast2srgb/config.toml")
install=quadcast2srgb.install
source=("quadcast2srgb-0.3.0.tar.gz::https://github.com/MuffinMario/quadcast2Srgb/releases/download/v0.3.0/quadcast2srgb-0.3.0.tar.gz")
sha256sums=('1662dc90484449e96721e1aaf9f18aeea4248d18737d9eb990294bdda149c2e9')

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
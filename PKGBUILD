# Maintainer: Mario T <admin@muffinmar.io>
pkgname=quadcast2srgb
pkgver=0.2.1
pkgrel=1
pkgdesc="Customizable RGB LED controller for HyperX Quadcast 2S"
arch=('x86_64')
url="https://github.com/MuffinMario/quadcast2Srgb"
license=('MIT')
depends=('hidapi' 'libsystemd')
makedepends=('cmake' 'gcc' 'pkgconf' 'tomlplusplus' 'git')
backup=("etc/quadcast2srgb/config.toml")
install=quadcast2srgb.install
source=("quadcast2srgb-0.2.1.tar.gz::https://github.com/MuffinMario/quadcast2Srgb/releases/download/v0.2.1/quadcast2srgb-0.2.1.tar.gz")
sha256sums=('26c629c32376247cdd21a2f61030062282f4b00d3ece91d3f1c6af735af58dfa')

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
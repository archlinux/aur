# Maintainer: Mario T <admin@muffinmar.io>
pkgname=quadcast2srgb
pkgver=0.4.0
pkgrel=1
pkgdesc="Customizable RGB LED controller for HyperX Quadcast 2S"
arch=('x86_64')
url="https://github.com/MuffinMario/quadcast2Srgb"
license=('MIT')
depends=('hidapi' 'libsystemd' 'mesa' 'portaudio' 'fftw')
makedepends=('cmake' 'gcc' 'pkgconf' 'tomlplusplus' 'git')
backup=("etc/quadcast2srgb/config.toml")
install=quadcast2srgb.install
source=("quadcast2srgb-0.4.0.tar.gz::https://github.com/MuffinMario/quadcast2Srgb/releases/download/v0.4.0/quadcast2srgb-0.4.0.tar.gz")
sha256sums=('1c763c3aa6753908aacc40337614b6d68c3f9f9458e9be537e539461d381eaae')

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
pkgname=spo-cli
pkgver=0.6.7
pkgrel=1
pkgdesc="a spotify tui app, less is more"
arch=('x86_64')
url="https://github.com/woquchonglang/spo-cli"
license=('GPL-2.1')
depends=('glibc')
options=('!debug' '!buildflags')
makedepends=('git' 'cmake' 'ninja' 'clang' 'mold' 'sdbus-cpp' 'python' 'pkgconf' 'openssl' 'alsa-lib' 'fftw' 'boost' 'liburing' 'ccache')
provides=('spo-cli')
conflicts=('spo-cli-bin')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('123423306e4aa134f0cb4cb3fa3d16435acdf06dcd938889cd8d0176dcd1b3ef')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname-$pkgver"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build --component spo-cli
}

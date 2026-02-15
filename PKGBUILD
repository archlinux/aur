# Maintainer: zepyx zepyxunderscore@gmail.com
pkgname=nucleus-shell
pkgver=0.1.0
pkgrel=1
pkgdesc="A official cli built for nucleus-shell"
arch=('x86_64')
url="https://github.com/xZepyx/nucleus-cli"
license=('MIT')
depends=('nlohmann-json' 'curl' 'unzip')
makedepends=('cmake' 'gcc' 'make' 'git')
source=("git+https://github.com/xZepyx/nucleus-cli.git")
sha256sums=('SKIP')  # git sources

pkgver() {
    cd "$srcdir/nucleus-cli"
    echo "0.1.0.r$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/nucleus-cli"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
    cmake --build build -- -j$(nproc)
}

package() {
    cd "$srcdir/nucleus-cli"
    cmake --install build --prefix="$pkgdir/usr"
}

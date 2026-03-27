# Maintainer: zepyx zepyxunderscore@gmail.com
pkgname=nucleus-shell
pkgver=0.2.0
pkgrel=1
pkgdesc="A blazingly fast cli/ctl for nucleus-shell"
arch=('x86_64')
url="https://github.com/nucleus-hq/nucleus-cli"
license=('MIT' 'GPL3')
depends=('nlohmann-json' 'curl' 'unzip')
makedepends=('cmake' 'gcc' 'make' 'git')

source=(
  "git+https://github.com/nucleus-hq/nucleus-cli.git"
)

sha256sums=('SKIP')

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

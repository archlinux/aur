# Maintainer: Techoraye <contact.techoraye@gmail.com>
pkgname=metetch
pkgver=0.5.4
pkgrel=1
pkgdesc="Fast system information display utility with modular customizable features"
arch=('x86_64')
url="https://github.com/techoraye/metetch"
license=('MIT')
depends=('ncurses' 'curl')
makedepends=('cmake' 'gcc' 'make')
optdepends=(
    'lm_sensors: for temperature monitoring'
    'mesa: for GPU information'
)
provides=("$pkgname")
conflicts=()
source=("https://github.com/techoraye/metetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    
    # Install license
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
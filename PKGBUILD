# Maintainer: Karthikey <karthikey.cse@gmail.com>

pkgname=bsh
pkgver=0.2.8
pkgrel=1
pkgdesc="High-performance, Git-aware, predictive terminal history middleware"
arch=('x86_64' 'aarch64')
url="https://github.com/karthikeyjoshi/bsh"
license=('MIT')
depends=('libgit2' 'sqlitecpp' 'python')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karthikeyjoshi/bsh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9110213492692db260420567910ee4869d9c01bb894a27be687247ca1dfc95d3')

build() {
    cd "$pkgname-$pkgver"
    
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_SYSTEM_SQLITECPP=ON
        
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"   
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 import_zsh.py -t "$pkgdir/usr/share/bsh/"   
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

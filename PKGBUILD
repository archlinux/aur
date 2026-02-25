# Maintainer: Karthikey <karthikey.cse@gmail.com>

pkgname=bsh
pkgver=0.2.9
pkgrel=1
pkgdesc="High-performance, Git-aware, predictive terminal history middleware"
arch=('x86_64' 'aarch64')
url="https://github.com/karthikeyjoshi/bsh"
license=('MIT')
depends=('libgit2' 'sqlitecpp' 'python')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karthikeyjoshi/bsh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('562e3eeed98921a83840f15cc2c0b83d81c7936b07894043427a7d754659f043')

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

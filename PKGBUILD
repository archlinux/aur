# Maintainer: huaji2369<3117086599@qq.com>
pkgname=the-absolute-reference
pkgver=0.5.7
pkgrel=1
pkgdesc="Reverse engineered implementation of Tetris the Absolute: The Grand Master 2 Plus"
arch=('x86_64')
url="https://github.com/burbruee/the-absolute-reference"
license=('MIT')
depends=('sdl2' 'physfs')
makedepends=('cmake')
options=(!debug)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa2b25f5fec7a26d75ccb1de720776313a46de7d0f8f7762d511b795c3a30a40')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -S . \
        -DCMAKE_C_STANDARD=99 \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build --target taref
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "./build/Source/Platform/SDL2/taref" "$pkgdir/usr/bin/taref"
    install -Dm644 "./License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

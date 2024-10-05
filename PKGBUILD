# Maintainer: Tyler Ristimaki <tpristimaki@gmail.com>

pkgname=ebus
pkgver=1.0.1
pkgrel=1
pkgdesc="An event bus that allows for inter-process communication by emitting and polling events on channels"
arch=('x86_64')
url="https://github.com/Tylo-6/ebus"
license=('GPL-3.0')
depends=('glibc')
makedepends=('gcc')
source=("https://github.com/Tylo-6/eBus/archive/refs/tags/v$pkgver-release.tar.gz")
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "$srcdir/eBus-"*

    mkdir -p "bin"

    g++ -fPIC -shared -o "bin/memory.so" "src/memory.cpp"
    g++ -fPIC -shared -o "bin/emitter.so" "src/emitter.cpp"
    g++ -fPIC -shared -o "bin/listener.so" "src/listener.cpp"    
}

package() {
    cd "$srcdir/eBus-"*

    install -Dm644 "include/ebus.hpp" "$pkgdir/usr/include/ebus.hpp"
    
    install -Dm755 "bin/memory.so" "$pkgdir/usr/lib/memory.so"
    install -Dm755 "bin/listener.so" "$pkgdir/usr/lib/listener.so"
    install -Dm755 "bin/emitter.so" "$pkgdir/usr/lib/emitter.so"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

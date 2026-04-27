# Maintainer: AnDenL <andenl145@gmail.com>
pkgname=crupp-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A Cargo-like build system for C++ (pre-built binary)"
arch=('x86_64')
url="https://github.com/AnDenL/crupp"
license=('MIT')
depends=('gcc' 'clang')
provides=('crupp')
conflicts=('crupp')
options=('!strip')

source=("https://github.com/AnDenL/crupp/releases/download/1/crupp-x86_64.tar.gz")
sha256sums=('13dec109aeca082f3b15a4a38f8949e7d0b540b9b5aab40df68545a7aaba5107')

package() {
    cd "$srcdir"
    
    if [ ! -f "crupp" ] && [ ! -f "crupp-x86_64" ]; then
        tar -xvf "${pkgname}-${pkgver}.tar.gz"
    fi

    BINARY=$(find . -maxdepth 2 -type f -name "crupp*" ! -name "*.tar.gz" | head -n 1)
    
    install -Dm755 "$BINARY" "$pkgdir/usr/bin/crupp"
}

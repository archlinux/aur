# Maintainer: Master290 <daniar@dev.tatar>
pkgname=cli-modplayer
pkgver=1.3.0
pkgrel=1
pkgdesc="A terminal-based Module player (.mod, .xm, .it, .s3m) with real-time visualization"
arch=('x86_64')
url="https://github.com/Master290/cli-tracker"
license=('MIT')
depends=('libopenmpt' 'portaudio' 'lame' 'flac')
makedepends=('cmake' 'git')
source=("git+https://github.com/Master290/cli-tracker.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/cli-tracker"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/cli-tracker"
    install -Dm755 build/cli-modplayer "$pkgdir/usr/bin/cli-modplayer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

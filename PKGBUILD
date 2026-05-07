# Maintainer: Love Billenius <lovebillenius@disroot.org>
pkgname=lolcat++
_reponame=lolcatpp
pkgver=2.5.2
pkgrel=1
pkgdesc="A lolcat reimplementation in C++ -- BLAZINGLY FAST"
arch=('x86_64' 'aarch64')
url="https://github.com/lolcatpp/lolcatpp"
license=('BSD-3-Clause')
depends=('boost' 'gcc-libs')
makedepends=('cmake')
provides=('lolcat' "$pkgname")
conflicts=('lolcat' "$pkgname-bin" 'lolcat-c' 'lolcat-rs')
source=("$_reponame-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d862838e0ea22be4d8d5e37d56814db6c10e9093ee5bb3f37435fb6ead536b80')

build() {
    cd "$srcdir/$_reponame-$pkgver"

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cd "$srcdir/$_reponame-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

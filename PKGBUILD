# Maintainer: Love Billenius <lovebillenius@disroot.org>
pkgname=lolcat++
_reponame=lolcatpp
pkgver=2.4.0
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
sha256sums=('63a06d9f4ce67d1bfeb778471076593ac6cadafd9ff002984aeb8a7f9ee7c514')

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

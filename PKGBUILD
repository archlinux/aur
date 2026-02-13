# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=the-shit
pkgver=1.0.0
pkgrel=1
pkgdesc="A vastly improved version of The Fuck written in C++"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/the-shit"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/V$pkgver.tar.gz")
sha256sums=('db48e02359f23d5ec27bd80810ac3ce26dc73fe1c3599c8a9a264399887a2d44')

build() {
    # It's cleaner to create a build directory
    cmake -B build -S "the-shit-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install the license file (mandatory if it's not a common system license)
    install -Dm644 "the-shit-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

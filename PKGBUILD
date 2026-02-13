# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=todo-bbs
pkgver=1.1.0
pkgrel=1
pkgdesc="A Retro-Styled Terminal TODO Manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/TODO-Manager"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/V$pkgver.tar.gz")
sha256sums=('318d9f5fe0f7b9c61ae7ba4e7bf30ee78d358903543245d210e590f88a074338')

build() {
    # It's cleaner to create a build directory
    cmake -B build -S "TODO-Manager-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install the license file (mandatory if it's not a common system license)
    install -Dm644 "TODO-Manager-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

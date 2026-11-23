# Maintainer: Iain <850557+netean@users.noreply.github.com>
pkgname=snippets-manager
pkgver=2.0
pkgrel=1
pkgdesc="Simple manager for text and code snippets, with folders, tags, rich text and quick search"
arch=('x86_64' 'aarch64')
url="https://github.com/netean/Snippets-Manager"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'syntax-highlighting' 'hicolor-icon-theme' 'libstdc++' 'libgcc' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/netean/Snippets-Manager/fd589bc60b3a66f1a62f5af43a40d92092d082c2/LICENSE")
sha256sums=('134b351acaf624976390fe9f9bebdd7e8ee351e03d1772a81ce0730fabd52273'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

build() {
    cmake -B build -S "Snippets-Manager-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

check() {
    # The tests run without a display and with their own settings and data folders
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

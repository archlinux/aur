# Maintainer: Vendetta1871
pkgname=fcitx5-commit
pkgver=0.1.0
pkgrel=1
pkgdesc='fcitx5 addon that lets other programs insert text into the focused input field over D-Bus'
arch=('x86_64')
url='https://github.com/Vendetta1871/fcitx5-commit'
license=('GPL-3.0-or-later')
depends=('fcitx5' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
conflicts=('fcitx5-commit-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1114b5f34f923622fc8445766a2351458a387a429a6deb628cb1165cb2990ac9')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

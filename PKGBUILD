# Maintainer: Vendetta1871
pkgname=fcitx5-commit-git
pkgver=r1.ebdf77c
pkgrel=1
pkgdesc="fcitx5 addon that lets other programs insert text into the focused input field over D-Bus"
arch=('x86_64')
url="https://github.com/Vendetta1871/fcitx5-commit"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git')
provides=('fcitx5-commit')
conflicts=('fcitx5-commit')
source=("fcitx5-commit::git+https://github.com/Vendetta1871/fcitx5-commit.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fcitx5-commit"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$srcdir/fcitx5-commit" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$srcdir/fcitx5-commit/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

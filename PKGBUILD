# Maintainer: Aridan <https://github.com/actuallyaridan>
pkgname=linux-devmgmt-git
pkgver=r0.unknown
pkgrel=1
pkgdesc="A faithful recreation of the Windows Device Manager (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/actuallyaridan/linux-devmgmt"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'git')
provides=('linux-devmgmt')
conflicts=('linux-devmgmt')
source=("$pkgname::git+https://github.com/actuallyaridan/linux-devmgmt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$pkgname" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

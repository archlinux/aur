# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-git
pkgver=0.9.r33.g8f2ddc8
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=('git+https://github.com/nhktmdzhg/VMK.git')
sha256sums=('SKIP')
install='fcitx5-vmk.install'

pkgver() {
    cd "$srcdir/VMK"
    local version=$(grep "^project(fcitx5-vmk VERSION" fcitx5-vmk/CMakeLists.txt | \
    sed 's/.*VERSION \([0-9.]*\).*/\1/')
    
    local count=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    
    echo "${version}.r${count}.g${hash}"
}

build() {
    cd "$srcdir/VMK"
    make build
}

package() {
    cd "$srcdir/VMK"
    make install DESTDIR="$pkgdir"
}

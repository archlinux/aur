# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk
pkgver=0.10.0
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=(
    "git+https://github.com/nhktmdzhg/VMK.git#tag=v$pkgver"
    'git+https://github.com/BambooEngine/bamboo-core.git'
)
sha256sums=('SKIP' 'SKIP')
install='fcitx5-vmk.install'

prepare() {
    cd VMK
    git submodule init
    git config submodule.bamboo/bamboo-core.url "$srcdir"/bamboo-core
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/VMK"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$srcdir/VMK"
    make install DESTDIR="$pkgdir"
}
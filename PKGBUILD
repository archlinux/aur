# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus
pkgver=1.5.2
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'systemd-libs' 'pyside6' 'python-dbus')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11' 'python')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=(
    "git+https://github.com/LotusInputMethod/fcitx5-lotus.git#tag=v$pkgver"
    'git+https://github.com/LotusInputMethod/bamboo-core.git'
)
sha256sums=(
    '1962e4ef8b1e7bf0dca431df830d916c394f7be962461d0f2ce2a25b1cb8eb87'
    'SKIP'
)
install='fcitx5-lotus.install'

prepare() {
    cd "$srcdir/fcitx5-lotus"
    git submodule init
    git config submodule.bamboo/bamboo-core.url "$srcdir"/bamboo-core
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/fcitx5-lotus"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$srcdir/fcitx5-lotus"
    make install DESTDIR="$pkgdir"
}

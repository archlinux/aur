# Maintainer: Yang Niao <yang at fascode dot net>
# Contributor: Naoaki Iwakiri <naoaki at gmail dot com>
# Contributor: Weng Xuetian <wengxt at gmail dot com>

# package metadata
pkgname='fcitx5-cskk-git'
pkgver=1.2.0.r8.gb2f93ed
pkgrel=1

# General
pkgdesc='SKK input method plugin for fcitx5 that uses LibCSKK'
arch=('x86_64') # maybe
url='https://github.com/fcitx/fcitx5-cskk'
license=('GPL3')

# Dependencies
depends=('gettext' 'fcitx5' 'qt5-base' 'qt5-declarative' 'fcitx5-qt' 'cskk')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")


# Source
source=("git+https://github.com/fcitx/${pkgname%-git}.git")

# sha256sums
sha256sums=('SKIP')

# pkgver
pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# build
build() {
    cd "${pkgname%-git}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

# package
package() {
    cd "${pkgname%-git}/build"
    make DESTDIR="${pkgdir}" install
}

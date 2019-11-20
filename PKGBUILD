# Maintainer: gbr <gbr@protonmail.com>
_pkgname=vibrantlinux
pkgname=vibrantlinux-git
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux (NVIDIA only)'
arch=('x86_64' 'i686')
url='https://gitlab.com/zee220/vibrantlinux'
license=('MIT')
depends=('nvidia-settings' 'qt5-base')
makedepends=('git')
conflicts=()
source=("${_pkgname}::git+https://gitlab.com/zee220/vibrantlinux.git" 'vibrantLinux.desktop')
sha256sums=('SKIP' 'SKIP')
pkgver=1.2.2.r3.gd872dbc

pkgver() {
    cd "${_pkgname}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    qmake
    make ${MAKEFLAGS}
}

package() {
    cd "${_pkgname}"

    make INSTALL_ROOT="${pkgdir}" install

    for res in 16 32 64 128 256 512
    do
        install -Dm664 "assets/icon${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vibrantLinux.png"
    done
    install -Dm644 "${srcdir}/vibrantLinux.desktop" "${pkgdir}/usr/share/applications/vibrantLinux.desktop"
}

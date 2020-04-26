# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Container: gbr <gbr@protonmail.com>

_pkgname=vibrantlinux-amd
pkgname=${_pkgname}-git
pkgver=1.2.5.r1.g4ed73ef
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux (AMD only)'
arch=(x86_64)
url="https://github.com/Scrumplex/vibrantLinux-AMD"
license=('MIT')
depends=('vibrantx' 'qt5-base')
makedepends=('git')
conflicts=("vibrantlinux-git" "vibrantlinux")
provides=("vibrantlinux-git" "vibrantlinux")
source=("${_pkgname}::git+https://github.com/Scrumplex/vibrantLinux-AMD.git"
        "vibrantLinux.desktop")
sha512sums=('SKIP'
            '21531277bbcea2ab65116f8420db9197f99801f34f934f9bd181fb2077c3c26337c7356df236783a53eee6dccc3e994f7992c9aaa8d53ca32ec0d98231357b1f')


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

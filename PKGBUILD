# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Container: gbr <gbr@protonmail.com>

_pkgname=vibrantlinux
pkgname=${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux (AMD only)'
arch=(x86_64)
url="https://github.com/zee-mzha/vibrantLinux"
license=('MIT')
depends=("qt5-base" "libxnvctrl" "vibrant" "libxrandr")
makedepends=("git")
conflicts=("vibrantlinux")
provides=("vibrantlinux")
source=("${_pkgname}::git+https://github.com/zee-mzha/vibrantLinux.git"
        "vibrantLinux.desktop")
sha512sums=('SKIP'
            '21531277bbcea2ab65116f8420db9197f99801f34f934f9bd181fb2077c3c26337c7356df236783a53eee6dccc3e994f7992c9aaa8d53ca32ec0d98231357b1f')


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

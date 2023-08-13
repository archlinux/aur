# Copyright (C) 2019-2023 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

pkgname=guix-installer
pkgver=1.4.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="A command line installer for Guix"
arch=(any)
url="https://www.gnu.org/software/guix/"
license=('GPL3')
depends=('coreutils'
         'glibc'
         'gnupg'
         'grep'
         'sed'
         'shadow'
         'tar'
         'wget'
         'which'
         'xz')

source=("https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh?h=${_pkgver}"
        "https://git.savannah.gnu.org/cgit/guix.git/plain/COPYING?h=${_pkgver}")

sha256sums=('ca78fa55d34d2a442c0677dc703aa56ef775859e8d8f2f8725e7ac064fb5fecb'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha512sums=('5210d6f2f1a61bc178d6e7bc466d50bc902195a9c93f62a72710cc039270016828013d87744d3c99ed5939e1df8c9d3be703041a944bcc5ffb5cd65f4ca19f3c'
            '7633623b66b5e686bb94dd96a7cdb5a7e5ee00e87004fab416a5610d59c62badaf512a2e26e34e2455b7ed6b76690d2cd47464836d7d85d78b51d50f7e933d5c')

prepare() {
    mkdir -p "${pkgname}-${_pkgver}"
    cd "${pkgname}-${_pkgver}"
    cp "${srcdir}/guix-install.sh?h=${_pkgver}" guix-install.sh
    cp "${srcdir}/COPYING?h=${_pkgver}" COPYING
}

package() {
    cd "${pkgname}-${_pkgver}"
    install -d "${pkgdir}/usr/bin"
    install -m 755 guix-install.sh -t "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

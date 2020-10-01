# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=guix-installer
pkgver=v1.1.0
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
         'wget'
         'which'
         'xz')

source=("https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh?h=${pkgver}"
        "https://git.savannah.gnu.org/cgit/guix.git/plain/COPYING?h=${pkgver}")

sha256sums=('5e037ad198fe02455b309f05bdf80c166c468c06666a46910dd25cdf37bd1fd3'
	    '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha512sums=('afd946a4ea6fbf5fa44d6d90a3689f74291ba02df6c03d86922d26d809926c509cc761ed8743d26e03f20c588c71c2f73a1c27f34609bdcb527218798ba73d7e'
	    '7633623b66b5e686bb94dd96a7cdb5a7e5ee00e87004fab416a5610d59c62badaf512a2e26e34e2455b7ed6b76690d2cd47464836d7d85d78b51d50f7e933d5c')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    cp "${srcdir}/guix-install.sh?h=${pkgver}" guix-install.sh
    cp "${srcdir}/COPYING?h=${pkgver}" COPYING
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/bin"
    install -m 755 guix-install.sh -t "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

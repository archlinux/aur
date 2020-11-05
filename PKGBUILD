# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=intelxed
_pkgname=xed
pkgver=11.2.0
pkgrel=1
pkgdesc="x86 encoder decoder"
arch=('x86_64')
url="https://intelxed.github.io"
license=('Apache')
depends=()
makedepends=('mbuild' 'doxygen')
provides=('intelxed')
source=("https://github.com/intelxed/xed/archive/11.2.0.tar.gz")
sha256sums=('715355c9f996869e9a4e275d4ab2470a312fbe95169d69385b9336f03b1f82b6')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./mfile.py doc examples install --shared ${MAKEFLAGS}
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"/kits/xed-install-base-*-lin-x86-64

    # remove unneeded files
    rm -rf extlib/ mbuild/ misc/

    # install binaries, headers, and libraries
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/*
    install -dm 755 "${pkgdir}/usr/include"
    cp -r include/* "${pkgdir}/usr/include/"
    install -Dm 644 -t "${pkgdir}/usr/lib" lib/*

    # install doc and examples
    install -dm 755 "${pkgdir}/usr/share/"{doc,$pkgname}
    cp -r doc/ref-manual "${pkgdir}/usr/share/doc/$pkgname"
    cp -r examples "${pkgdir}/usr/share/$pkgname/examples"
}

# vim: set sw=4 ts=4 et:

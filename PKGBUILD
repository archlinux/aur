# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=intelxed
_pkgname=xed
pkgver=12.0.1
pkgrel=1
pkgdesc="x86 encoder decoder"
arch=('x86_64')
url="https://intelxed.github.io"
license=('Apache')
depends=()
makedepends=('mbuild')
source=("https://github.com/intelxed/xed/archive/${pkgver}.tar.gz")
sha256sums=('b2dfa6c0e92eaefa326892cf85a6b65aa8a4eabaea9953c3c1dc078f24f1b0e5')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./mfile.py --static install ${MAKEFLAGS}
    ./mfile.py --shared install ${MAKEFLAGS}
    ./mfile.py examples install ${MAKEFLAGS}
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"/kits/xed-install-base-*-lin-x86-64

    # remove unneeded files
    rm -rf extlib/ mbuild/ misc/ doc/ examples/

    # install binaries, headers, and libraries
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/*
    install -dm 755 "${pkgdir}/usr/include"
    cp -r include/* "${pkgdir}/usr/include/"
    install -Dm 644 -t "${pkgdir}/usr/lib" lib/*
}

# vim: set sw=4 ts=4 et:

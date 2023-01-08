# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=slarchive
pkgver=3.1
pkgrel=1
pkgdesc="A SeedLink client for archiving data streams."
arch=("x86_64")
url="https://github.com/EarthScope/slarchive"
license=('Apache-2.0')
depends=('libslink')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b142e3292ffc6e4f4010e162d3f86beed8518967a770a4764b52d0f38cdf322')

prepare() {
    cd "${pkgname}-${pkgver}/src"
    sed -i 's|^CFLAGS .*||' Makefile
    sed -i 's|^GCCFLAGS .*||' Makefile
    sed -i 's|^LDFLAGS .*||' Makefile
}

build() {
    cd "${pkgname}-${pkgver}/src"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname}"
    install -D -t "${pkgdir}/usr/share/man/man1/" -m 644 "doc/${pkgname}.1"
}
# vim:set ts=4 sw=4 et:

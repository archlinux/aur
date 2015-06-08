# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

pkgname="redeclipse"
pkgver="1.5.1"
pkgrel="2"
pkgdesc="free, casual arena shooter"
arch=("i686" "x86_64")
url="http://redeclipse.net"
license=("custom" "CC0" "CCPL:by" "CCPL:by-sa" "ZLIB" "MIT")
makedepends=("ed")
depends=("sdl_image"  "libgl" "sdl_mixer" "hicolor-icon-theme" "glu")
install="redeclipse.install"
source=("base-${pkgver}.tar.gz::https://github.com/red-eclipse/base/archive/v${pkgver}.tar.gz"
        "data-${pkgver}.tar.gz::https://github.com/red-eclipse/data/archive/v${pkgver}.tar.gz"
        "0e67905e42fae53e7d1f377fe8cd7e6a88f3cbb9.patch")
sha256sums=('2982c4337f4b344c6d77def6b2baec3a2b99b70a88752137475845f95c4d5193'
            'eba632f57b4fa76d6701950907231b354398883613da36c17dbc062c1758dd37'
            '390e51b2a4fe73da94a044ed46f03ca7257335e5bef021eb1b1bf73bb4236cc1')

prepare() {
    cd "${srcdir}/base-${pkgver}"
    rmdir data
    mv "${srcdir}/data-${pkgver}" data
    patch -p1 -i "${srcdir}/0e67905e42fae53e7d1f377fe8cd7e6a88f3cbb9.patch"
}

build() {
    cd "${srcdir}/base-${pkgver}"
    make -C src/ client server
}

package() {
    cd "${srcdir}/base-${pkgver}"
    make -C src/ DESTDIR="${pkgdir}" prefix=/usr system-install
    install -Dm 0644 "${srcdir}/base-${pkgver}/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm 0644 "${srcdir}/base-${pkgver}/doc/all-licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/all-licenses.txt"
}

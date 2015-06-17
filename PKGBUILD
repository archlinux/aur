# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

pkgname="redeclipse"
pkgver="1.5.2"
pkgrel="1"
pkgdesc="free, casual arena shooter"
arch=("i686" "x86_64")
url="http://redeclipse.net"
license=("custom" "CC0" "CCPL:by" "CCPL:by-sa" "ZLIB" "MIT")
makedepends=("ed")
depends=("sdl_image"  "libgl" "sdl_mixer" "hicolor-icon-theme" "glu")
install="redeclipse.install"
source=("base-${pkgver}.tar.gz::https://github.com/red-eclipse/base/archive/v${pkgver}.tar.gz"
        "data-${pkgver}.tar.gz::https://github.com/red-eclipse/data/archive/v${pkgver}.tar.gz")
sha256sums=('6c50e44b05d9bcad6793b3330108c439798df41c43e64a30a78b2dc362465c63'
            'eb2133698166de3b1f7bdd413d593f2710cac7e9df4f8750c8523c3987beb78f')

prepare() {
    cd "${srcdir}/base-${pkgver}"
    rmdir data
    mv "${srcdir}/data-${pkgver}" data
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

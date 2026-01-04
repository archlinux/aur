# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=chmap
pkgver=1.1.1
pkgrel=1
pkgdesc="A CLI utility to get info for Unicode characters"
arch=('x86_64' 'i686')
url="https://github.com/kiedtl/chmap/"
license=('MIT')
makedepends=('scdoc')
checkdepends=('bc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kiedtl/chmap/archive/${pkgver}.tar.gz"
        version.patch)
sha512sums=('ea99c51199dca81322fabc4ea94686cddb8f9ffea2036495902e5ea46225155a8ab0e32babd482b708a02a503ecdd208f24cc6b3fb8cc802e1b534748b6f33c6'
            '7d316265b6f7d643c7f7822a4d9c43341c0bdf14afc56c292b4560e1a86bb2369a903154b4f28c926441bd84f53733739dd6fc198af7984fffb6f70c9854490b')

prepare() {
    patch -d $pkgname-$pkgver -Np1 -i ../version.patch
}

check() {
    cd ${pkgname}-${pkgver}

    make check
}

build() {
    cd ${pkgname}-${pkgver}

    make release
}

package() {
    cd ${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dvm644 LICENSE.md -t ${pkgdir}/usr/share/licenses/${pkgname}
}

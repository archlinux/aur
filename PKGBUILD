# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clingo
groups=('potassco')
pkgver=5.0.0
pkgrel=1
pkgdesc="Grounding tools for (disjunctive) logic programs."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=()
makedepends=('bison' 're2c' 'scons')
source=("https://github.com/potassco/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=(4242bbc03227a16e29760275bb08d9eb657c49e5)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons --build-dir=release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/release"
    install -D gringo ${pkgdir}/usr/bin/gringo
    install -D clingo ${pkgdir}/usr/bin/clingo
    install -D reify ${pkgdir}/usr/bin/reify
    install -D lpconvert ${pkgdir}/usr/bin/lpconvert
    if [ -x "python/clingo.so" ]; then
        install -D "python/clingo.so" ${pkgdir}/usr/lib/libclingo_python.so
    fi
    if [ -x "lua/clingo.so" ]; then
        install -D "lua/clingo.so" ${pkgdir}/usr/lib/libclingo_lua.so
    fi
}

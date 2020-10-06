# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr
pkgver=1.0.0
pkgrel=1
pkgdesc="A port of LuRsT's hr to c"
arch=("i686" "x86_64")
url="https://github.com/djmattyg007/hr"
license=('custom:Public Domain')
source=("https://github.com/djmattyg007/hr/releases/download/${pkgver}/hr-${pkgver}.tar.gz")
sha512sums=("5e53749217bf3516bcf625a72428d7839839a722183d36ba7af333ab8e374379e9cbde753249a30aed474f2f8dc781ebead5a7a761f127d7d4b516e6cb59bfd5")

build() {
    cd "hr-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "hr-${pkgver}"
    make -k check
}

package() {
    cd "hr-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    rm "${pkgdir}/usr/share/doc/hr/LICENSE.txt"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr/LICENSE.txt"
}

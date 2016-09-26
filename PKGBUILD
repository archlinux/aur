# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
# Contributor: Einhard Leichtfuß <archer@respiranto.de>

pkgname=thunderbird-enigmail-bin
_pkg_main_ver=1.9
pkgver=${_pkg_main_ver}.5
pkgrel=2
pkgdesc="The Mozilla Thunderbird GnuPG encryption plugin for both 32 and 64 bit systems. Binary version."
arch=('i686' 'x86_64')
url="http://www.mozilla-enigmail.org/"
license=('MPL')
depends=('thunderbird')
provides=('thunderbird-enigmail')
conflicts=('enigmail' 'thunderbird-enigmail')
replaces=('enigmail-64-bin' 'enigmail-bin')
install="${pkgname}.install"
source=("http://www.mozilla-enigmail.org/download/release/${_pkg_main_ver}/enigmail-${pkgver}-sm+tb.xpi"{,.asc})
noextract=("enigmail-${pkgver}-sm+tb.xpi")
sha384sums=('SKIP'
            'SKIP')

package() {
    mkdir "${pkgname}"
    bsdtar -C "${pkgname}" -xf "enigmail-${pkgver}-sm+tb.xpi"

    cd "${pkgname}"
    _eid=$(grep -m 1 '<em:id>' install.rdf | sed 's/.*>\(.*\)<.*/\1/')
    mkdir -p "${pkgdir}/usr/lib/thunderbird/extensions/${_eid}"
    cp -r ./. "${pkgdir}/usr/lib/thunderbird/extensions/${_eid}"
}

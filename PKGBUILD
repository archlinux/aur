# Maintainer: JosuA <aginagajosu at gmail dot com>
pkgname=hunspell-eu-xuxen
pkgver=5.4.10
pkgrel=1
pkgdesc="Basque (Xuxen) dictionary for Hunspell"
arch=('any')
url="https://xuxen.eus/"
license=('LGPL-3.0-or-later')
depends=('hunspell')
provides=('hunspell-eu')
conflicts=('hunspell-eu')
source=("https://xuxen.eus/static/hunspell/xuxen_${pkgver}_hunspell.zip")
sha256sums=('5a82e3e37b2a48fb0b1ddfeb995524d89838b5fbe2729ac833235fa10968b415')

package() {
    # install
    install -d "${pkgdir}/usr/share/hunspell"
    install -m644 "${srcdir}/eu_ES.aff" "${pkgdir}/usr/share/hunspell/"
    install -m644 "${srcdir}/eu_ES.dic" "${pkgdir}/usr/share/hunspell/"

    # symlinks
    install -d "${pkgdir}/usr/share/myspell/dicts"
    pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in "${pkgdir}/usr/share/hunspell"/*; do
        ln -s "/usr/share/hunspell/$(basename "${file}")" .
    done
    popd

    # license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

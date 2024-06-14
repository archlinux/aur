# Maintainer:  Berrit Birkner <aur at bbirkner dot de>

pkgname=thunderbird-extension-import-export-tools-ng
_pkgname=import-export-tools-ng
pkgver=14.0.3
pkgrel=1
pkgdesc="Thunderbird extension that adds import and export functions for messages, folders and profiles."
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('GPL-3.0-or-later')
makedepends=('p7zip' 'jq')
source=("https://github.com/thunderbird/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('516ea5e5643be825677eab3d906bb652bc55d99dc35ed5ae30b0e96515b8dcec')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    7z a ./xpi/${_pkgname}-${pkgver}-tb.xpi ./src/*
}

package() {
    depends=('thunderbird>=115' 'thunderbird<116')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    _archivefilename=$(jq -r '.applications.gecko.id ' src/manifest.json)
    install -D -m644 "xpi/${_pkgname}-${pkgver}-tb.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_archivefilename}.xpi"
}

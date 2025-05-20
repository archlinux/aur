# Maintainer:  Berrit Birkner <aur at bbirkner dot de>

pkgname=thunderbird-extension-import-export-tools-ng
_pkgname=import-export-tools-ng
pkgver=14.1.8
pkgrel=1
pkgdesc="Thunderbird extension that adds import and export functions for messages, folders and profiles."
arch=('any')
url='https://addons.thunderbird.net/addon/importexporttools-ng/'
license=('GPL-3.0-or-later')
makedepends=('p7zip' 'jq')
source=("${_pkgname}-${pkgver}"::"https://github.com/thunderbird/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('216a9187ef12762dcecce52711e5b6d1f86b24b6e18bec5cd2ba8f39bf31c13e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    7z a ./xpi/${_pkgname}-${pkgver}-tb.xpi ./src/*
}

package() {
    depends=('thunderbird>=115' 'thunderbird<129')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    _archivefilename=$(jq -r '.applications.gecko.id ' src/manifest.json)
    install -D -m644 "xpi/${_pkgname}-${pkgver}-tb.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_archivefilename}.xpi"
}

# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-commodore-petme
pkgname=(
    'ttf-kreativekorp-commodore-petme-pet'
    'ttf-kreativekorp-commodore-petme-c64'
    'ttf-kreativekorp-commodore-petme-c128'
)
pkgver=2020.05
pkgrel=2
pkgdesc="KreativeKorp's ultimate Commodore font bundle: Pet Me, with variations for the PET, the C64, and the C128."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')
conflicts=('ttf-petme')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'petme.zip::https://www.kreativekorp.com/swdownload/fonts/retro/petme.zip'
)
sha256sums=(
    '5479b901ef7b5f87bbd1a24ca13afe116f56450f97025ac6e28776f5a77edf6e'
)

_install_font() {
    local fontspec="$1"
    
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -regex "${fontspec}" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-commodore-petme-pet() {
    pkgdesc="KreativeKorp's Commodore PET font: Pet Me, with 3 different variations."

    _install_font '.*PetMe\(2[XY]\)?\.ttf$'
}

package_ttf-kreativekorp-commodore-petme-c64() {
    pkgdesc="KreativeKorp's Commodore 64 (C64) font: Pet Me 64, with 2 different variations."

    _install_font '.*PetMe64.*\.ttf$'
}

package_ttf-kreativekorp-commodore-petme-c128() {
    pkgdesc="KreativeKorp's Commodore 128 (C128) font: Pet Me 128, with 2 different variations."

    _install_font '.*PetMe128.*\.ttf$'
}


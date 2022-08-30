# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=libreoffice-extension-vietnamese-spellchecker-git
_extname='vietnamese-spellchecker'
provides=('libreoffice-extension-vietnamese-spellchecker')
conflicts=('libreoffice-extension-vietnamese-spellchecker')
pkgver=2.2.0.r35.g507d07e
pkgrel=2
pkgdesc="Vietnamese spellchecker extension for LibreOffice"
arch=('x86_64')
url="https://github.com/1ec5/hunspell-vi.git"
license=('GPL3')
depends=('libreoffice')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/hunspell-vi"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/hunspell-vi/"

    # Install extension files
    install -D -m644 "openoffice/3.x/META-INF/manifest.xml" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/META-INF/manifest.xml"

    install -D -m644 "openoffice/3.x/description.xml" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/description.xml"

    install -D -m644 "openoffice/3.x/dictionaries.xcu" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/dictionaries.xcu"

    install -D -m644 "openoffice/3.x/LICENSES-vi.txt" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/LICENSES-vi.txt"

    install -D -m644 "openoffice/3.x/LICENSES-en.txt" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/LICENSES-en.txt"

    install -D -m644 "dictionaries/vi-DauMoi.dic" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/dictionaries/vi_VN.dic"

    install -D -m644 "dictionaries/vi-DauMoi.aff" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/dictionaries/vi_VN.aff"

    # Apply version number to files
    perl -pi -e "s/SPELLCHECKERVERSION/${pkgver}/" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/description.xml" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/dictionaries.xcu" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/LICENSES-vi.txt" \
        "${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/LICENSES-en.txt"
}

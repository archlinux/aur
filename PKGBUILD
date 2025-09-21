# Maintainer: Brany <code@garage-c0.re>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.8.10
pkgrel=3
pkgdesc="Asciidoc FX is a book / document editor to build PDF, Epub, Mobi and HTML books, documents and slides"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache-2.0')

makedepends=('gendesk')
depends=('bash')

source=(
    "https://github.com/asciidocfx/AsciidocFX/releases/download/v${pkgver}/AsciidocFX_Linux.tar.gz"
    "${pkgname}"
)

sha256sums=('527de8696678650ccd98e4aed604cf4e64ef2c54c3e1c0c4010c034141d00a75'
            'e773f39bdc3fec42e37c1086752ac7d25f09b31c8e221053554ba791534b19c6')


prepare() {
    cd "${srcdir}"
    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --name "AsciidocFX" \
        --exec "/usr/bin/asciidocfx" \
        --categories "Development;Office;WordProcessor;TextTools;ComputerScience;Documentation;Java"
}

package() {

    # install luncher script
    install -Dm 755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

    # install tarball script
    install -dDm 755 ${srcdir}/AsciidocFX ${pkgdir}/opt/
    cp -r ${srcdir}/AsciidocFX ${pkgdir}/opt/

    install -Dm 755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

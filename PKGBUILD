# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.44
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('x86_64')
url="https://github.com/Picocrypt/Picocrypt"
_urlraw="https://raw.githubusercontent.com/${basename}/${basename}/${pkgver}"
license=('GPL3')
makedepends=('tar')
conflicts=('picocrypt')
provides=('picocrypt')
depends=('gtk3')
source=("${basename}_${pkgver}.deb::https://github.com/${basename}/${basename}/releases/download/${pkgver}/${basename}.deb"
        "LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md"
        "INTERNALS_${pkgver}::${_urlraw}/Internals.md"
        "CHANGELOG_${pkgver}::${_urlraw}/Changelog.md")
sha256sums=('df313b8402570434cd5b4f9943b21225e5d841bc003fc73b898c4b9f60d55a25'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f2499e5e44f75ef9a93fff84a084e2f703e18843cc775b0ce1b92fbcdbe374fc'
            '896de1b0c7927fa9fd0377821cbeb5050db7300977b401a0131ee210b84b518f'
            'fc6d3469887761db83b027cff2d563bed862e1857e1faa0ac93d2f7b2310cede')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    mv "${pkgdir}/usr/bin/picocrypt-gui" "${pkgdir}/usr/bin/picocrypt"
    ln -sf "${pkgdir}/usr/bin/picocrypt" "${pkgdir}/usr/bin/picocrypt-gui"

    install -Dm644 "${srcdir}/LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/INTERNALS_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/INTERNALS.md"
    install -Dm644 "${srcdir}/CHANGELOG_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

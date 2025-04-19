# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.48
pkgrel=2
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
sha256sums=('654e14930cf853be0d4c4a4beb3c51eebb18f046aad04f58a2fa5476256f26fa'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '29b646e0679c083b674a6cbf5b756d6369e8346b26452b2bf416c54766285aa6'
            '896de1b0c7927fa9fd0377821cbeb5050db7300977b401a0131ee210b84b518f'
            'f5a65b52a7d49952ea1ee4c8a2c00a1b8aa8d94b2c0e58febced99d83ca9872c')

package() {
    cd "${pkgdir}" || return 1

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    mv "${pkgdir}/usr/bin/picocrypt-gui" "${pkgdir}/usr/bin/picocrypt"
    ln -rsf "${pkgdir}/usr/bin/picocrypt" "${pkgdir}/usr/bin/picocrypt-gui"

    install -Dm644 "${srcdir}/LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/README_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/INTERNALS_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/INTERNALS.md"
    install -Dm644 "${srcdir}/CHANGELOG_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

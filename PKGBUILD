# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.49
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
sha256sums=('d1fa4260af8827bec251568723f0da8ae5a81cc5e29276130a024ac587f19b67'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '361cd1d0262b4ff508f66df5139c832c1e4c9a031b0bf9aea5c247646bea435b'
            '896de1b0c7927fa9fd0377821cbeb5050db7300977b401a0131ee210b84b518f'
            '4faca5b12160db8fa04536fffa7ea72f29543889fcf6a23c075bf8dcd1a2e7c1')

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

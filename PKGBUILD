# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.42
pkgrel=5
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
sha256sums=('a7525a21a81647e8d56bc99ba7c8fa298971c82bde4923972186fa8766a19026'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '448cf5ef087e51272e8efdef69ec3e37c740815b6063da903fedffaeacf7cc75'
            '896de1b0c7927fa9fd0377821cbeb5050db7300977b401a0131ee210b84b518f'
            'c1ae8429d046ae2ed23f5815125a7174a0f6a0e250f9c11195b3525655585d7f')

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

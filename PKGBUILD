# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.42
pkgrel=3
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('x86_64')
url="https://github.com/Picocrypt/Picocrypt"
_urlraw="https://raw.githubusercontent.com/${basename}/${basename}/${pkgver}"
license=('GPL3')
makedepends=('tar')
conflicts=('picocrypt')
provides=('picocrypt')
depends=('gtk3')
source=("https://github.com/${basename}/${basename}/releases/download/${pkgver}/${basename}.deb"
        "${_urlraw}/LICENSE" "${_urlraw}/README.md" "${_urlraw}/Internals.md" "${_urlraw}/Changelog.md")
sha256sums=('a7525a21a81647e8d56bc99ba7c8fa298971c82bde4923972186fa8766a19026'
            'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    mv "${pkgdir}/usr/bin/picocrypt-gui" "${pkgdir}/usr/bin/picocrypt"
    ln -sf "${pkgdir}/usr/bin/picocrypt" "${pkgdir}/usr/bin/picocrypt-gui"

    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${srcdir}/LICENSE
    install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ${srcdir}/*.md
}

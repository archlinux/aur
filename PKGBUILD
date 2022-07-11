# Maintainer: Luke Arms <luke@arms.to>

pkgname=asciicast2gif
pkgver=0.2.1
pkgrel=2
pkgdesc="Generate GIF animations from asciicasts (asciinema recordings)"
arch=('any')
url="https://github.com/asciinema/asciicast2gif"
license=('MIT')
depends=('nodejs' 'imagemagick' 'gifsicle')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('32142c7bbc43540960fe19c99e05b8bc50ddc99970a34a2264d0d437cd3c6a15')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # See https://github.com/npm/npm/issues/9359 and
    # https://bugs.archlinux.org/task/63396
    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}

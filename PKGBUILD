# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='moxygen'
pkgdesc="Doxygen XML to Markdown converter"
pkgver=0.7.12
pkgrel=1
arch=('any')
url="https://github.com/sourcey/moxygen"
license=('MIT')
depends=('doxygen' 'nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sourcey/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ee4f1a653ed14cfd7172c317d02a118406582b5b31286a46f0037ee0b59f54e79783af64cd25d25d514695b88e045153ddbc5d78a0540da3a7d91e57a2f72f1d')
validpgpkeys=('') # TODO https://github.com/sourcey/moxygen/issues/20

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm install --production -g --user root --prefix "${pkgdir}"/usr "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    rm -r "${pkgdir}"/usr/etc

    # Install license
    install -Dm 644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix npm derp
    find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
}

# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>

pkgname=bitwarden-dmenu
pkgver=1.5.9
pkgrel=1
pkgdesc="dmenu adapter for bitwarden-cli"
arch=('any')
url="https://github.com/andykais/bitwarden-dmenu"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha512sums=('c99082fafe7382dd7609fb790676b2ca7391a99a2db89fd492866c4243dd11fbb40828e426dacb51b2fec5d7d35ee17f1541244f4763be365b0d967bc8074d6d')

package() {
    cd "${srcdir}"
    npm install "${pkgname}-${pkgver}.tar.gz" -g --user root --prefix "${pkgdir}/usr" --production
    # Delete reference to source dir
    find ${pkgdir} -name package.json -type f -exec sed -i 's/"_where": ".*",//g' {} \;
    # Point remaining references to pkgdir to /
    find ${pkgdir} -name package.json -type f -exec sed -i "s!${pkgdir}/${pkgname}!/!g" {} \;
}

# vim:set ts=4 sw=4 et:

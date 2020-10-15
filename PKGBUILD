# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>

_commit=b5f7aeeb2ed10fd9328e6e3a74eaec2287b6d97c
pkgname=bitwarden-dmenu
pkgver=1.5.6
pkgrel=1
pkgdesc="dmenu adapter for bitwarden-cli"
arch=('x86_64')
url="https://github.com/andykais/bitwarden-dmenu"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha512sums=('3ba2316fe6e857c9237d2e79381bb6d8cc4279e7e3f8ed58933e0e6addd65bf4b7247cdb071b30a2bd7e47ce263afeec8a6404c283f845bf151059061afb841f')

package() {
    cd "${srcdir}"
    npm install "${pkgname}-${pkgver}.tar.gz" -g --user root --prefix "${pkgdir}/usr" --production
    # Delete reference to source dir
    find ${pkgdir} -name package.json -type f -exec sed -i 's/"_where": ".*",//g' {} \;
    # Point remaining references to pkgdir to /
    find ${pkgdir} -name package.json -type f -exec sed -i "s!${pkgdir}/${pkgname}!/!g" {} \;
}

# vim:set ts=4 sw=4 et:

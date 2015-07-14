# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=0.8.9
pkgrel=1
arch=('any')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg' 'nodejs')
makedepends=('npm')

source=("https://github.com/keybase/node-client/archive/v${pkgver}.tar.gz")
sha1sums=('a8f3acbc1f69026e630abc71d0559d67440de1a8')

build() {
    cd "${srcdir}/node-client-${pkgver}"

    make
    npm install
}

package() {
    cd "${srcdir}/node-client-${pkgver}"

    mkdir -p "${pkgdir}/usr/lib/node_modules/${pkgname}"
    cp -r bin json lib sql node_modules build-stamp package.json \
          "${pkgdir}/usr/lib/node_modules/${pkgname}/"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/node_modules/${pkgname}/bin/main.js \
          "${pkgdir}/usr/bin/keybase"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

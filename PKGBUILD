# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=8.6.2
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
makedepends=('git' 'npm')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('d6a49be56b8178986a9a422c73cfee6f')
options=('!strip')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm pack
    npm install -g --user root --prefix "${pkgdir}"/usr "${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chmod -R a+rX "${pkgdir}/usr"
    find "${pkgdir}/usr/lib/node_modules/drawio-batch" -type f -perm /111 -exec chmod a+rx \{\} \;
}

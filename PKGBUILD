# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=10.6.3
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
makedepends=('git' 'npm')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('cf4a1dbd7e8e178ad05db7e7765a2a97')
options=('!strip')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm pack
    npm install -g --user root --prefix "${pkgdir}"/usr "${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chmod -R a+rX "${pkgdir}/usr"
    find "${pkgdir}/usr/lib/node_modules/drawio-batch" -type f -perm /111 -exec chmod a+rx \{\} \;
}

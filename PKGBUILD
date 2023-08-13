# Maintainer: Luke Arms <luke@arms.to>

pkgname=ovsx
pkgver=0.8.3
pkgrel=1
pkgdesc="Command line interface for Eclipse Open VSX"
arch=('any')
url="https://open-vsx.org"
license=('EPL2')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('f371bf3a5bc6cedc52ac8ed6743c6f1d4c35793ddf958c32e25f3f83b3a2c3ed')

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/.npm" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # See https://github.com/npm/npm/issues/9359 and
    # https://bugs.archlinux.org/task/63396
    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}

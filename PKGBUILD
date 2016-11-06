# $Id$
# Maintainer: kpcyrd <git@rxv.cc>

pkgname=memry
pkgver=2.0.0
pkgrel=2
pkgdesc="mem'ry, tar pipe curl"
url='https://github.com/kpcyrd/memry'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha512sums=('e1d938bcb8a625e747ab531d0fd903866a42e9380c278cd64a18fa20cd72c1b4df292d9e9f32d82d72081f8b88608cb3a7125d85b969d067a2c54df45610b111')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    node-gyp rebuild -C "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/scrypt"
    rm -r "${pkgdir}/usr/etc"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../lib/node_modules/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm 644 package/contrib/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 644 package/contrib/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:

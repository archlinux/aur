# Maintainer: kpcyrd <git@rxv.cc>

pkgname=memry
pkgver=2.0.1
pkgrel=2
pkgdesc="mem'ry, tar pipe curl"
url='https://github.com/kpcyrd/memry'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
install='memry.install'
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha512sums=('fccc5c284ea4134a204069218795346e0888a780dae6af72ee3add51c84649c8945860d0cbeabf18ab68f40abfb2eb440a169398299420f73d692a3f1d8d619c')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    node-gyp rebuild -C "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/scrypt"
    rm -r "${pkgdir}/usr/etc"

    install -dm0750 -o 337 -g 337 "${pkgdir}"/var/lib/memry/{,storage/}

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../lib/node_modules/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm 644 package/contrib/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 644 package/contrib/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:

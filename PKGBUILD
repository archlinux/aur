# Maintainer: kpcyrd <git@rxv.cc>

pkgname=memry
pkgver=2.0.1
pkgrel=4
pkgdesc="mem'ry, tar pipe curl"
url='https://github.com/kpcyrd/memry'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'python2')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "memry-sysuser.conf"
        "memry-tmpfiles.conf")
sha512sums=('fccc5c284ea4134a204069218795346e0888a780dae6af72ee3add51c84649c8945860d0cbeabf18ab68f40abfb2eb440a169398299420f73d692a3f1d8d619c'
            '6512005ed2cbbdd77dabf7e5562ac91159c487dcb8ef26bfc94595e232c5e261ae1851b40ceb4d63d60ae95a88cbe061a7946d3f7bf5c2b9aecff3e6b6d575ec'
            'c79d3e954cba6d4041b097dc46134db68eb105e24846d3e229350ec7126f4b778e6983a5835ab8f2b5140642eb40e269ad93ec35d745795c589c647cd68cb01a')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  node-gyp rebuild -C "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/scrypt"

  install -Dm644 package/contrib/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 memry-sysuser.conf "${pkgdir}/usr/lib/sysusers.d/memry.conf"
  install -Dm644 memry-tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/memry.conf"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 package/contrib/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:

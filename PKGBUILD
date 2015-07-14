pkgname='quicktun'
pkgdesc='Simple and secure VPN software'
pkgver='2.2.4'
pkgrel='2'
arch=('i686' 'x86_64' 'arm')
depends=('libsodium')
url='http://wiki.ucis.nl/QuickTun'
license=('custom')
source=("http://oss.ucis.nl/quicktun/src/${pkgname}-${pkgver}.tgz")
sha512sums=('da60fc39d8e85d5b2c162633840b887be3fd58d9f2b3a99fe605fa13546e4f53878ce6246d835b7931e42193fb044330c539b29751cdb6f54d025efc52041487')

prepare () {
  cd "${pkgname}-${pkgver}"
  sed -e '1,/\*\//p' -e d src/keypair.c > COPYING
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS='-Wno-pointer-to-int-cast' ./build.sh
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm755 out/quicktun.combined "${pkgdir}/usr/bin/quicktun"
  install -Dm755 out/quicktun.keypair "${pkgdir}/usr/bin/quicktun.keypair"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

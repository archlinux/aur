# Maintainer: Holden Lewis <holdenplewis at gmail dot com>

pkgname=impostor-server-bin
pkgver=1.1.0
pkgrel=3
pkgdesc='Unofficial dedicated server for Among Us (binary release).'
url='https://impostor.github.io/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=('zlib' 'krb5')
provides=('impostor-server')
conflicts=('impostor-server')
options=('!strip')
source=("https://github.com/Impostor/Impostor/releases/download/v${pkgver}/Impostor-Server-linux-x64.zip"
        "impostor.service")
sha512sums=('f05213362fd5415608e6cebfd01250ebbb2bba320561d77c9bd20cb91e41c112faa3b8db2d4ecc3afccf2c2b28553516bc53a05c07218603200f2835e6b5f2b6'
            '0b6fb15b0f6fbd9fdd1407e47a22fe71dce5fb31d9021142b3e1b0c5689252fab7300081a65e4b4221c1ac9803f2dadb03994eece608c917d58481d1a7fb8b9f')

prepare() {
  mv Impostor.Server impostor-server
  chmod +x impostor-server
}

package() {
  
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/impostor/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  cp --verbose "${srcdir}/impostor-server" "${pkgdir}/usr/bin/"
  cp --verbose "${srcdir}/config.json" "${pkgdir}/etc/impostor/"
  cp --verbose "${srcdir}/impostor.service" "${pkgdir}/usr/lib/systemd/system/"
}

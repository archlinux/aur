# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=pbzx
pkgver=1.0.2
pkgrel=2
pkgdesc="stream parser for OS X payloads in .pkg files (Niklas Rosenstein's fork)"
arch=('x86_64')
url="https://github.com/NiklasRosenstein/${pkgname}"
license=('GPL3')
depends=('xar' 'xz')
optdepends=('cpio: postprocessing of the extracted archive')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('33db3cf9dc70ae704e1bbfba52c984f4c6dbfd0cc4449fa16408910e22b4fd90')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ${CC:-gcc} ${CFLAGS} ${LDFLAGS} -o pbzx pbzx.c $(pkg-config liblzma --cflags --libs) -lxar
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 pbzx ${pkgdir}/usr/bin/pbzx
}

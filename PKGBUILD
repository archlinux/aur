# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=4.0
pkgrel=3
pkgdesc="Command line utilities for working with epub files"
arch=('x86_64')
url="https://codeberg.org/dinofp/${pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
makedepends=(stack)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dinofp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('550db9e7ab13d1c5355f30ebfec13175461a1ceb0dd366126ac726992c10b620')
build() {
  cd "${srcdir}/${pkgname}"
  LDFLAGS="${LDFLAGS//-Wl,-z,pack-relative-relocs /}"
  PREFIX="../dist" ./util/install.sh
}
package() {
  cd "dist"
  install -Dm755 "usr/bin/epubzip" "${pkgdir}/usr/bin/epubzip"
  install -Dm755 "usr/bin/epubmeta" "${pkgdir}/usr/bin/epubmeta"
  install -Dm755 "usr/bin/epubname" "${pkgdir}/usr/bin/epubname"
  install -Dm644 "usr/share/doc/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "usr/share/doc/${pkgname}/changelog.md" "${pkgdir}/usr/share/doc/${pkgname}/changelog.md"
  install -Dm644 "usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

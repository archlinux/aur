# Maintainer: Merkil <merkil@savhon.org>

pkgname=delta
pkgver=20060803
pkgrel=3
dapkgver=2006.08.03
license=('BSD')
url="http://delta.tigris.org/"
pkgdesc="An useful tool that lets you minimize interesting files subject to a test of their interestingness."
arch=(i686 x86_64)
depends=('perl')
makedepends=('make' 'gcc' 'flex' 'curl')
source=("git+https://salsa.debian.org/debian/delta.git#tag=upstream/2006.08.03")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${dapkgver}/"
  make clean
  make || return 1
  make check || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${dapkgver}/"
  install -Dm 755 ./topformflat "${pkgdir}/usr/bin/topformflat"
  install -Dm 755 ./delta "${pkgdir}/usr/bin/delta"
  install -Dm 755 ./multidelta "${pkgdir}/usr/bin/multidelta"
  install -Dm 644 ./License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

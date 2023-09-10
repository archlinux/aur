# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Hydranix <Hydranix@gmx.com>
pkgname=rapidxml
pkgver=1.13
pkgrel=5
pkgdesc="Attempt to create the fastest XML parser possible, written in modern C++."
arch=(any)
url="https://rapidxml.sourceforge.net/manual.html"
license=(Boost MIT)
source=("https://sourceforge.net/projects/rapidxml/files/rapidxml/rapidxml%20${pkgver}/rapidxml-${pkgver}.zip"
        "0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch")
sha256sums=('c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571'
            '3275f425b9c7feaed5567697c5d589ae1d2abcf60933ce55b0b888ca26b05d76')

prepare() {
  cd rapidxml-"${pkgver}"
  patch -p2 --binary < "${srcdir}/0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/include/rapidxml"
  cd "rapidxml-${pkgver}"
  install -Dm644 *.hpp          -t "${pkgdir}/usr/include/${pkgname}"
  install -Dm644 "license.txt"  -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "manual.html"  -t "${pkgdir}/usr/share/doc/${pkgname}"
}

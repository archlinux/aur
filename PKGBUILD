# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

_prjname=wxFormBuilder
pkgname=wxformbuilder
pkgver=3.10.1
pkgrel=2
pkgdesc="RAD tool for wxWidgets GUI design"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wxFormBuilder/wxFormBuilder"
license=('GPL2')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxwidgets-gtk3' 'boost')
makedepends=('cmake')
source=(
  "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v3.10.1/wxFormBuilder-3.10.1-source-full.tar.gz"
  "auitabart.patch"
)
sha512sums=(
  "de8d51b8907529fd882bcd1908fbce49381f0e75bfb0ea00b319d856d835769739e03b829b9ede5d1439513fba1e42bbc247e51cde54f89dc50efa1b0bc43a4c"
  "ecf3df7d10852ea5137713ea5568cb42601e3bd2047d9a020288617cc503d42027de414bbd739d16e695354e2822361a6510d2a14f93b88ec4d433dc680fc16f"
)
prepare() {
    cd "${_prjname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/auitabart.patch"
}
build() {
  cd "${_prjname}-${pkgver}"
  cmake -S . -B _build --install-prefix /usr -DCMAKE_BUILD_TYPE=Release
  cmake --build _build --config Release
}
package() {
  cd "${_prjname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install _build --config Release
}

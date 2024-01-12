# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

_prjname=wxFormBuilder
pkgname=wxformbuilder
pkgver=4.0.0
pkgrel=1
pkgdesc="RAD tool for wxWidgets GUI design"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wxFormBuilder/wxFormBuilder"
license=('GPL2')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxwidgets-gtk3' 'boost')
makedepends=('cmake')
source=(
  "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v${pkgver}/wxFormBuilder-${pkgver}-source-full.tar.gz"
  "tinyxml2-no-install.patch"
)
sha512sums=(
  "fd50f66584a6b03d7cb2281d20649fb39b2d4923dadfa44bc244732d524a08483ed9c7a97fbf02d613b7a1e494858b9ea0d2d13a554bcca2dab277cfa892ecc1"
  "cb941a55d67104f68a3b1ab84f19c5016d96ba52efb9ea7755be33f52af6c5ce8fba36f25e8f10d0ddd38ed9842192a6ef55a9de2b54b3428aed4e360653b7c0"
)
prepare() {
    cd "${_prjname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/tinyxml2-no-install.patch"
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

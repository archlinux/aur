# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

_prjname=wxFormBuilder
pkgname=wxformbuilder
pkgver=3.10.1
pkgrel=1
pkgdesc="RAD tool for wxWidgets GUI design"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wxFormBuilder/wxFormBuilder"
license=('GPL2')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxgtk3')
makedepends=('ninja' 'meson')
source=(
  "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v3.10.1/wxFormBuilder-3.10.1-source-full.tar.gz"
  "nativefile.ini"
)
sha512sums=(
  "de8d51b8907529fd882bcd1908fbce49381f0e75bfb0ea00b319d856d835769739e03b829b9ede5d1439513fba1e42bbc247e51cde54f89dc50efa1b0bc43a4c"
  "c44a263897bc22e46bbe8d106cb0e4ee4c331fec0d271b4140055c59a891360c251fa7f33ce7b83fa8a3515c954c6cbf9b06eddaff2e3b671709d652fd603836"
)
build() {
  cd "${_prjname}-${pkgver}"
  meson _build --native-file "${srcdir}/nativefile.ini" --prefix /usr
  ninja -C _build
}
package() {
  cd "${_prjname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C _build install
  mkdir -p "${pkgdir}/usr/share/mime/packages/"
  cp -r "install/linux/data/gnome/usr/share" "${pkgdir}/usr"
  install -m644 "install/linux/debian/wxformbuilder.sharedmimeinfo" "${pkgdir}/usr/share/mime/packages/wxformbuilder.xml"
}

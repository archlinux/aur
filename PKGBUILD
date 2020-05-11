# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.23.0
pkgrel=1
pkgdesc="A streaming music downloader"
arch=('x86_64' 'armv7h')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('83439fdcea707dcc6a782dd99a3a939c0cae40bddb55d3991ca0df3fdd2c747e9a00fce91ded95b2e2f43dd17b4de017f3dea76c6e004caf1fbe22031ca9fd9e')

build() {
  cd "${srcdir}/${pkgname}"
  npm i
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/"
  echo -e '#!/usr/bin/bash\nnode /usr/lib/smloadr/SMLoadr.js "$@"' > "${pkgdir}/usr/bin/smloadr"
  chmod +x "${pkgdir}/usr/bin/smloadr"
}

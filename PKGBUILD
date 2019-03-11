# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.9.5
pkgrel=1
pkgdesc="A streaming music downloader"
arch=('x86_64')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('686f148addf601b8209e51c02fdaa1baf5468b9b39b9fd277833560cec30a1a9eb3a6ab20d0891573338f2b15477ce7903289f85ea5bd20316fbce9c47ccd5c7')

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

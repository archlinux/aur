# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.10.0
pkgrel=1
pkgdesc="A streaming music downloader"
arch=('x86_64' 'armv7h')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('4881e3dd4a5c788cd1dc9831f165eeb3e76fa6879017f865c11175f535a95815e16b43a968768a74f0d0c3bf32ba24983b4df3cbbb52025f1d3eb20cdaf8ed49')

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

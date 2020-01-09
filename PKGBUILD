# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.20.0
pkgrel=1
pkgdesc="A streaming music downloader"
arch=('x86_64' 'armv7h')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('4e62f790f49117df073000579383a415b71bc294a044ca82940f69b4bdb2307b596420de063a2f4c3310054d0d51fbf6b72ffefabc5bbbcbe3aa2473cd1d8d8d')

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

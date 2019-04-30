# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.9.5
pkgrel=3
pkgdesc="A streaming music downloader"
arch=('x86_64' 'armv7h')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('f33dea616327ae4cf82e7cb5b9bfcdcdc72ca1428d0e3a9487ad180e4eaa68aa6becafd0a455c8d65409f9c78795086c647fcedb4fb6c858b679fa14295c54a0')

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

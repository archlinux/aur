# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr-git
_pkgname=SMLoadr
pkgver=v1.9.5.r3.g6a14361
pkgrel=1
pkgdesc="A streaming music downloader"
arch=('x86_64' 'armv7h')
url="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("git+https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr.git")
sha512sums=('SKIP')
conflicts=('smloadr')

pkgver() {
   cd "${_pkgname}"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm i
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib/smloadr"
  echo -e '#!/usr/bin/bash\nnode /usr/lib/smloadr/SMLoadr.js "$@"' > "${pkgdir}/usr/bin/smloadr"
  chmod +x "${pkgdir}/usr/bin/smloadr"
}

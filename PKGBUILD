# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=smloadr
pkgver=1.9.2
pkgrel=2
pkgdesc="A streaming music downloader"
arch=('x86_64')
url="https://git.teknik.io/SMLoadrDev/SMLoadr"
license=('unknown')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://git.teknik.io/SMLoadrDev/SMLoadr/archive/v${pkgver}.tar.gz")
sha512sums=('c595e61dbb1586156b1a6c5ade1ecce351192d1a47d378d8082f68b94f8dbae4985f719d98a3140a176c54c5fda253330bba04da45e1e5cdc0678d60b45f84b0')

build() {
  cd "${srcdir}/${pkgname}"
  npm i
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/"
  echo -e "#!/usr/bin/bash\nnode /usr/lib/smloadr/SMLoadr.js" > "${pkgdir}/usr/bin/smloadr"
  chmod +x "${pkgdir}/usr/bin/smloadr"
}

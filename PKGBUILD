# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=hyperpotamus
pkgver=0.37.3
pkgrel=2
pkgdesc="YAML/JSON automation scripting for web requests"
arch=('x86_64')
url="https://github.com/pmarkert/hyperpotamus"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pmarkert/hyperpotamus/archive/v${pkgver}.tar.gz")
sha512sums=('b8d1b48e78518bcf2fa1027e53e94c5be6576aa1dee999fc38ffc2c722ab9abd4f67353982ba676bcf57c460ed074629015f9c560243a408e958d8887a5a1700')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm i
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/lib/hyperpotamus"
  install -d "${pkgdir}/usr/bin"
  cp -r cli docs examples hdb.js hyperpotamus.js lib node_modules package.json  "${pkgdir}/usr/lib/hyperpotamus"
  echo -e '#!/usr/bin/bash\nnode /usr/lib/hyperpotamus/hyperpotamus.js "$@"' > "${pkgdir}/usr/bin/hyperpotamus"
  chmod +x "${pkgdir}/usr/bin/hyperpotamus"

  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


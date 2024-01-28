# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=dict
pkgver=0.1.0
pkgrel=1
pkgdesc="An easy to use english dictionary for the command line."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
install="${pkgname}.install"
depends=('nodejs' 'npm')
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '45aa05a64d9083fb4edd6e8b7cba661e0e09b15ae00fd64b185b7ad0874df5dddc8a4204b6e3ef4eb38b4b80327bf0ae9412ff1aa0422614819a37d2694ccbc9'
)
md5sums=(
  'bca763480b69f2f8e57d6cdbbb2517e0'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  [ -d "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}"

  which yarn >/dev/null 2>&1 && yarn install || npm install

  cd ../../../../

  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  !which ${pkgname} >/dev/null 2>&1 && install -Dm0755 usr/bin/* -t "${pkgdir}/usr/bin/" ||
    install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

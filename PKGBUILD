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
  '50042a338576c96ae3b162ee7224fe767d5c3b6fd9597307bd64b7adbdb8ad3b28d56febdda2111fe64880dfce8b426bd6f8ce5b4d6a288e359457445a1b7c96'
)
md5sums=(
  'cbdb41d18184566e7af2a3942553867c'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  [ -d "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}"

  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}

  which yarn >/dev/null 2>&1 && yarn install || npm install

  cp -ar ${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname} 2>/dev/null & installed=$?;
  [ $installed -eq 0 ] || cp -ar ${srcdir}/usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

  install -Dm644 ${srcdir}/${pkgname}/usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null & installed=$?;
  [ $installed -eq 0 ] || install -Dm644 ${srcdir}/usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

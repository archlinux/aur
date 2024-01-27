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
  'ca65aceedb19f874278e0769d0551efb949075d9b37f207991d3424872a9285814470f34cee8abcdf0ac84265632c64f68e17f39931fbf42ce8d1593dae00aef'
)
md5sums=(
  'fd6666f731e5649102f0d218e7683c80'
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

  install -Dm644 ${srcdir}/${pkgname}/usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null ||
    install -Dm644 ${srcdir}/usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

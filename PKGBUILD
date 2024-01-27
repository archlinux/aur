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
  'de48fdd15e76602a8c04665b1053359a1e9145b15034e39606c454661b35aef68f34e032c6253582abeab3dc4d43d3f16fb6b54d1a3410ba729b666488dc7f68'
)
md5sums=(
  'f8cb5cae95f2c5cf46a826b8e620c5de'
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

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
  '8ec4a02c5f508bd8c6a7ca52102ac0a3d2078f4200252666551033bc3127e43359c367892b03236e2ed89e75972e7124aa053a84091c9cd95852aab634f5c4f7'
)
md5sums=(
  '919e21674d3a3f1d6abeaf122edc3071'
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

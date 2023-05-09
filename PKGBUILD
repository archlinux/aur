# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="An easy to use CLI YouTube client"
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv npm)
install="yt-cli.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '4ebc4e1c5e68f1442d29a1520383e6cda2e2fc65e7830dba1e723dbca3431823d94f8b8e0d30dac9b26622aee9c9728fecec2df0d08a4c60d9eea464098d721e'
  '92a943c7ffa89f14bfa5644cafa8aa2df9ed15303022e24056359e8fe6cb3754893102c735583098325494e325026289749a6ded91f9ba5fa692d41030a89705'
  )
md5sums=(
  'feba800d0bdf939e2f9959324ccc5dce'
  'e1499850752dfaad6c2584f7c2345bff'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
  )

package() {

  [ -d "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/usr/lib/node_modules/${pkgname}"

  which yarn >/dev/null 2>&1 && yarn install || npm install

  [ -d "${srcdir}/${pkgname}" ] && cd "${srcdir}/${pkgname}" || cd "${srcdir}"

  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

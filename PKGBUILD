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
  '1f2dc7bd5a92810acd751ad5020300f983525059a72dbebdb90091212127adc7ed8ead2c4584695b71f7c6a29d35f9c0cf96ee7fde686693389edf3420ec8d8f'
  'b54db16a51819c8f306ecefda7a3646b20f60ca1fb72c59e8765509d7ad2386e60e3171df2fc334c1d09c6091e54e2f06feaafcd76966cddb6be530c645d4493'
  )
md5sums=(
  'e80eda72be264df30b35df6632422455'
  'a41c27c121e5c7e7d9dd8ed9add09e13'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
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

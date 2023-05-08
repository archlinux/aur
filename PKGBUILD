# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-mpv
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI YouTube client"
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv nodejs)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '69ea51438b65d20715c5f6045e9cb3ed184dff844265d0a9995d5b5295ffad9004db1d48f8c0b24be00e994d6d69e439cd297a0e626af8f7599974bed1654286'
  '83e30593af1ffc9fa5794d4b9dcd7a6edcbb60060b5e5fd7fb7589291afde5586365d9ecdbffbeb03990adbb51e1393dc435a8011019e0447385106b42eb3d9d'
  )
md5sums=(
  '7182bb5006763c676abf09d78dfa5bc4'
  'b00ad88fec49cc4ff458fd8271992d41'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {

  [ -d "$srcdir/$pkgname" ] && cd "$srcdir/$pkgname" || cd "$srcdir"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  cd "${pkgdir}/usr/share/${pkgname}"
  which yarn >/dev/null 2>&1 && yarn install || npx yarn install
  which yarn >/dev/null 2>&1 && yarn install || npx yarn link

}

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
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '9f4d02ae96ce7414ec1f8e5f3e563a273a21276737f7f14d6b80aff8aef4169032fa753f03220737c091f6d1d69890ddeca501e39808a867589235e609dfc23a'
)
md5sums=(
  '00dd3c84b511599a09538cf3e3494ae5'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  echo "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}"
  [ -d "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}"

  which yarn >/dev/null 2>&1 && yarn install || npm install

  cd ../../../../
  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -Dm0755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.2.0
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
  'ad9ac65f01acf7b12bf357811ea321790ba8b7b4b0db0beb7ba266e4d53c6e545aaf1ff9e909cf22c96e2f2721844a6b15d962887521416fe3042b2baef3b092'
)
md5sums=(
  '596ad9e1dcb2a50ab852bc4c2b669168'
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
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 usr/share/zsh/site-functions/_${pkgname} "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"

  [ -z `which ytcli` ] && install -Dm0755 usr/bin/* -t "${pkgdir}/usr/bin/" ||
    install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

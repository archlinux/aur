# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.2.1
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
  'e8a228bf73ee84dfcdf23469c5b1ba7b4a8ebbc1478df9fc33eb2c0c241e069ec995890c50caf99bfced29f47568764b56bd24dad15dc72395bef7f9cecb1ead'
)
md5sums=(
  '78e9bc1f5fc978cebbdc70b21f29e1bd'
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

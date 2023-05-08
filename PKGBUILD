# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.1.0
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
  '7d1f7c50d38721a85233fe0508ca981d92d9a524217af19383d94da7e3fefa7adc3067cfe4b306ad0f88bf2172d0bd487e3c0a741f3eb70d3bea8dedd108fd87'
  '83f03b5aeb37a73000849e789b12f3361ed1adf9158572f8c8ba819e48e2faaae2207b77143db226842c35a213c42037539031e6c4a43ee8e3b92609a3d5e128'
  )
md5sums=(
  '91577e90572b492fa0701c13a76f9024'
  '5f1c2e7126800fb1b1a41804d79e1fc9'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')


build() {

  [ -d "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/usr/lib/node_modules/${pkgname}"

  which yarn >/dev/null 2>&1 &&
    yarn install || npm install

}

package() {

  [ -d "${srcdir}/${pkgname}" ] && cd "${srcdir}/${pkgname}" || cd "${srcdir}"

  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

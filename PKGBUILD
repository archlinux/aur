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
  'a745ee50037b2a3acb04e58eb945ad611cc3caf543ccb1b846adfc1ae20db45a651517490d3f822a24200233bd21c820ba7306622ba9d7526fa2eac92dc98031'
  'd706454a8023b5e82defdea948f8d3ecafd9efc543dab981f6bb4275c02858811a29d69f05cf89263b6c02c5f617eeb445eaf0a05b51b1c075592b101e182d42'
  )
md5sums=(
  '9224d3bcca862b8e0bdb6f8b4c0eeaaa'
  'a0366da15dd7851ab8b1c2ff827686e4'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')


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

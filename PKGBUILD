# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="A CLI YouTube client, with buit-in search and download capabilities."
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv npm)
install="yt-cli.install"
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '6f0291902f7467a45b7a00c633ae918ba3152c784b0f6168813653986f0b84c9e5320d5ed3ec9206148bc86874d7ecae2e6d887bbfda7fb37a13c3b78d0f898d'
)
md5sums=(
  'e58b26cc8d4c1f3e941800087b59b09d'
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

  !which ytcli >/dev/null 2>&1 && install -Dm0755 usr/bin/* -t "${pkgdir}/usr/bin/" ||
    install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}

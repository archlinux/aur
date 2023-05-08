# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-mpv
pkgver=0.1.3
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
  '403a9a69af75cccd698c5187ac8b836d28b6b1cdb28ed4a9cc87c6d2ee2217afc7041db970154f5835cc95c8d29d82e3b85d4dac3a7f848c97ae4455a84c917c'
  'aa79339ab23b4f6d1aafb8826c14df4e74003a056bf35abd842caded9d8e3fa9385bdccf10bd94b8767d26942aed42f05d270bea9f262d0a2e25e8004b74da8d'
  )
md5sums=(
  '8368050594075e0baa4221630c56dba4'
  'ccf0cdb96f064018efb2a269cd6d6998'
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

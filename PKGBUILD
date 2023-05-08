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
  '9865f32e474c4ceec31b5b4c332a2da0d220a22d39112c34ffcab907ea6850e03923b6a4d01e5f6ea7f39e4260d9e4d73c79f1fde707aa6ded7e05488b6189bc'
  '28a433c157036493abd66e401feddd56ff9e18d13b661934e1541197286496a123332e7df21a6f5cc1c2d5585a6467b66e2b82471b6df4ddb485227418c9cec2'
  )
md5sums=(
  '960c3aa8a422f6e6c6006ea751180ff6'
  '34e703460c5ea0454fe0ba721f1b784d'
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

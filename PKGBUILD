pkgname=osu-tachyon
_pkgname=${pkgname%}
pkgver=2025.911.0
pkgrel=1
pkgdesc="osu!lazer unstable branch."
arch=(x86_64)
url="https://osu.ppy.sh"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(osu-tachyon)
conflicts=(
  osu-lazer
  osu-tachyon)
options=(!strip !debug)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/ppy/osu/releases/download/$pkgver-tachyon/osu.AppImage"
  "icon.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-tachyon.desktop"
  "osu-tachyon-uri-handler.desktop"
  "osu-tachyon"
)
noextract=("osu.AppImage")
sha256sums=(
  '317c81e34f14318c764c2c3907ee2ef3dc43980dca911ab0c1b0561f6d959226'
  '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51'
  'SKIP'
  '19a9941f5f5aa627282ba80a45f1f04894bb62d4a9ee5e6729849f6df11e845c'
  '28571f5d68253a39e4d0462a8d42fa079c03a69cf1fef79e5ae8b7fb008c6f3f'
  '406fa8500d3c8d6245551f11aa74c0d9cb13f73d9ef0a3a9f25dcbb84a771b49'
  )
package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/osu-tachyon/osu.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" osu-tachyon

  # Install pixmap, desktop and license file
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/osu-tachyon.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-tachyon.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-tachyon-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}


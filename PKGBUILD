# Maintainer: David Husička <contact@bydave.net>
# Contributor: Tyler Nelson <neo@cybercat.cc>
# Contributor: Tuhana GAYRETLİ <tuhana at tuta dot io>
# Contributor: Quenten Schoonderwoerd <ellie at nicecock dot eu>

pkgname=osu-lazer-bin
_pkgname=${pkgname%-bin}
pkgver=2022.621.0
pkgrel=1
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
arch=(x86_64)
url="https://osu.ppy.sh"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(osu-lazer)
conflicts=(osu-lazer)
options=(!strip)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/ppy/osu/releases/download/$pkgver/osu.AppImage"
  "https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-lazer.desktop"
  "osu-lazer"
)
noextract=("osu.AppImage")
sha256sums=(
  "d1e71fc767753e7aaf37d4372eca141a7a15698bd0bf0d53e166bc8c9ab573fb"
  "36f73cfe0a84cd65a8bb54fcde5a01c419b134bee4a88cc92eb4f33236343a10"
  "30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244"
  "43aba829341aa5542d7cedf9e95215d553a7db73a65f169f0de5a25aac75b801"
  "baeea5b234e65707a4e6a563eacac89063bf20047d64125cd1f26c3c52aae957"
)

package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/osu-lazer/osu.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" osu-lazer

  # Install pixmap, desktop and license file
  install -Dm644 lazer.png "$pkgdir/usr/share/pixmaps/osu-lazer.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-lazer.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}

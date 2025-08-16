# Maintainer: David Husička <contact@bydave.net>
# Contributor: Tyler Nelson <neo@cybercat.cc>
# Contributor: Tuhana GAYRETLİ <tuhana at tuta dot io>
# Contributor: Quenten Schoonderwoerd <ellie at nicecock dot eu>
# Contributor: Antti <antti@antti.codes>

pkgname=osu-lazer-bin
_pkgname=${pkgname%-bin}
pkgver=2025.816.0
_pkgtag=$pkgver-lazer
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
options=(!strip !debug)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/ppy/osu/releases/download/$_pkgtag/osu.AppImage"
  "icon.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-lazer.desktop"
  "osu-lazer-uri-handler.desktop"
  "osu-lazer"
)
noextract=("osu.AppImage")
sha256sums=('98e8a143c9ad1c48aad051259098999749a106a3e2f02a06a30377e7c25cef60'
            '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            'e08a76a780960fffbd63fed26df21f0e7846d9bc8b366bfdbb54b07bf543113e'
            '44e9e6a85c43086644f427b62d6d8b265c0e2ac1b5091d8ff0c626c58a91836d'
            '3a4142edac534b9845c30d893392a4cb22d9e2825d05b6788942c18e30bd95a0')
package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/osu-lazer/osu.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" osu-lazer

  # Install pixmap, desktop and license file
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/osu-lazer.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-lazer.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-lazer-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}

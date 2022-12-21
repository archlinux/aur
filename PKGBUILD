# Maintainer: gigas002 <gigas002@pm.me>

pkgname=wowup-cf-bin
_pkgname=wowup-cf
pkgver=2.9.2.beta.8
_pkgver=2.9.2-beta.8
pkgrel=1
pkgdesc="WowUp the World of Warcraft addon updater (with CurseForge support)"
arch=(x86_64)
url="https://github.com/WowUp/WowUp.CF"
license=("GPL3")
depends=(
  zlib
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(!strip)
source=(
  "WowUp-CF-$_pkgver.AppImage::https://github.com/WowUp/WowUp.CF/releases/download/v$_pkgver/WowUp-CF-$_pkgver.AppImage"
  "https://raw.githubusercontent.com/WowUp/WowUp.CF/main/wowup-electron/assets/wowup_logo_cf.png"
  "https://raw.githubusercontent.com/WowUp/WowUp.CF/main/LICENSE"
  "$_pkgname.desktop"
  "$_pkgname"
)
noextract=("WowUp-CF-$_pkgver.AppImage")
sha256sums=('a2522f343048287da5f9eadf3424f6e29a2206ec6c14d52e6d366970c54e6afa'
            'fa00185ae0733121ca059bb0775486d7029446f9325d1bb666fc041a7ad965be'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '1b4c94e6a7b484b3dc7022b767019920d9d7d878b35aca4ddc5555bb5edf4ad6'
            '058b56582411b4ca5873fbbe7f402037df803e8ead9810ca8e0dda3422346dc5')

package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "WowUp-CF-$_pkgver.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  # Install pixmap, desktop and license file
  install -Dm644 wowup_logo_cf.png "$pkgdir/usr/share/pixmaps/wowup_logo_cf.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" $_pkgname.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

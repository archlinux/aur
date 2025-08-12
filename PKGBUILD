# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=wowup-cf-beta-bin
_pkgname=wowup-cf-beta
pkgver=2.21.0beta6
pkgrel=1
pkgdesc='WowUp the World of Warcraft addon updater (with CurseForge support) - Beta version'
arch=(x86_64)
url='https://github.com/WowUp/WowUp.CF'
license=("GPL3")
depends=(zlib fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
source=(
  "WowUp-CF-${pkgver}.AppImage::https://github.com/WowUp/WowUp.CF/releases/download/v${pkgver//beta/-beta.}/WowUp-CF-${pkgver//beta/-beta.}.AppImage"
  "wowup_logo_cf_beta.png::https://raw.githubusercontent.com/WowUp/WowUp.CF/main/wowup-electron/assets/wowup_logo_cf.png"
  'https://raw.githubusercontent.com/WowUp/WowUp.CF/main/LICENSE'
  "${_pkgname}.desktop"
  "${_pkgname}"
)
noextract=("WowUp-CF-${pkgver}.AppImage")
sha256sums=('d76e24abd109afb3b062de471e8cab81922fa765d006c80c800fabd4f47ca723'
            'fa00185ae0733121ca059bb0775486d7029446f9325d1bb666fc041a7ad965be'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '486fa0c2b96addb58776e82867636bf1948cf913e5d324fd214bb363dce58bca'
            '8a408da10875baefb60dafd1681383223e3f5af9a3c18dec9f5ae4be9443f526')

package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "WowUp-CF-${pkgver}.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  # Install pixmap, desktop and license file
  install -Dm644 -t "$pkgdir/usr/share/pixmaps" wowup_logo_cf_beta.png
  install -Dm644 -t "$pkgdir/usr/share/applications" $_pkgname.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}


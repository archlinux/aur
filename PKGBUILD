# Maintainer: Tiver211 <tiver@tiver212.ru>

pkgname=yandex-music-bin
pkgver=5.102.0
pkgrel=1
pkgdesc="Official Yandex Music desktop app repackaged from the Debian package"
arch=('x86_64')
url="https://music.yandex.ru/download/"
license=('LicenseRef-custom')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
  'alsa-lib'
)
optdepends=(
  'libappindicator-gtk3: tray icon support'
)
options=('!strip' '!debug')

source=(
  "Yandex_Music_amd64_${pkgver}.deb::https://desktop.app.music.yandex.net/stable/Yandex_Music_amd64_${pkgver}.deb"
)

provides=('yandex-music' 'yamusic')

conflicts=(
  'yandex-music'
  'yamusic'
  'yandex-music-windows'
)

sha256sums=('9e751a3589e2042456061c4cb942cd9942b4891095f5dbae49d24b3d8c2f8253')

package() {
  bsdtar -xf "${srcdir}/Yandex_Music_amd64_${pkgver}.deb" -C "$srcdir"
  bsdtar -xf "${srcdir}/data.tar."* -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Яндекс Музыка/yandexmusic" "$pkgdir/usr/bin/yandexmusic"
  ln -s "/opt/Яндекс Музыка/yandexmusic" "$pkgdir/usr/bin/yandex-music"

  chmod 4755 "$pkgdir/opt/Яндекс Музыка/chrome-sandbox"

  install -Dm644 "$pkgdir/opt/Яндекс Музыка/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"

  install -Dm644 "$pkgdir/opt/Яндекс Музыка/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

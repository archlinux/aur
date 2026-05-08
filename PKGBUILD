# Maintainer: Tiver211 <tiver@tiver212.ru>

pkgname=yandex-music-bin
pkgver=5.101.2
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

sha256sums=('a002b341f49031191b4a57fe566e936385b89932ca53e853d72417a6ec760eae')

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

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=android-messages-desktop-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/Android-Messages-v$pkgver-linux-x64.pacman"
        "LICENSE-upstream::$url/raw/v$pkgver/LICENSE")
sha256sums=('3cbb72033b8ca0e90f7c57ac9c7c05d99e5ee49e675fa9d831cbcb791e9c7e53'
            '3ad8e115711a8eca0050f768179efdca0f978b195a9c4f856a9d805628d3886c')

package() {
  install -d "$pkgdir/opt/"
  cp -a opt/Android\ Messages "$pkgdir/opt/"

  install -Dm644 usr/share/applications/AndroidMessages.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE-upstream "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "usr/share/icons/hicolor/${i}x${i}/apps/AndroidMessages.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done
}

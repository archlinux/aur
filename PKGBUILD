# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=android-messages-desktop-bin
pkgver=5.7.1
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
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('edfffd35cda4ff96ca17362777a108e088ab28da5eb725a52a1d736c31060926'
            '3ad8e115711a8eca0050f768179efdca0f978b195a9c4f856a9d805628d3886c')

package() {
  install -d "$pkgdir/opt/"
  cp -a opt/Android\ Messages "$pkgdir/opt/"

  install -Dm644 usr/share/applications/AndroidMessages.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "usr/share/icons/hicolor/${i}x${i}/apps/AndroidMessages.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done
}

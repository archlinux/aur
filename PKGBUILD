# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=android-messages-desktop-bin
pkgver=5.3.1
pkgrel=2
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=('electron15')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/AndroidMessages-v$pkgver-linux-x64.pacman"
        "$url/raw/v$pkgver/LICENSE"
        "${pkgname%-bin}"
        "${pkgname%-bin}.desktop")
sha256sums=('01e36c24c7cdb6fb72f9afe4101ee59bf1e920603540f5301f7d475a1b06c2fd'
            '3ad8e115711a8eca0050f768179efdca0f978b195a9c4f856a9d805628d3886c'
            'fd0d7759e40d6f21b81fe288ffe0a0aee4a6a0457d59b889116067ddb39387fe'
            '1bf16b8864712b0c1de72d8c3764db14b75ecf64dae44d206a26aa036ac53b1a')

package() {
  install -d "$pkgdir/usr/lib/${pkgname%-bin}"
  cp -a opt/AndroidMessages/resources "$pkgdir/usr/lib/${pkgname%-bin}"

  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d $pkgdir$icons_dir
    install -m644 $srcdir$icons_dir/AndroidMessages.png \
      $pkgdir$icons_dir/${pkgname%-bin}.png
  done
}

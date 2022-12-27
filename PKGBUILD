# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=android-messages-desktop-bin
pkgver=5.4.1
pkgrel=1
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=('gtk3' 'nss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/Android.Messages-v$pkgver-linux-x64.pacman"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('73e823f930169eb9c1e64734f03c220a9410955b8253a4a1c3f72b753e3e0f3e'
            '3ad8e115711a8eca0050f768179efdca0f978b195a9c4f856a9d805628d3886c')

package() {
  install -d "$pkgdir/opt/"
  cp -a opt/Android\ Messages "$pkgdir/opt/"

  install -Dm644 usr/share/applications/AndroidMessages.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 ${srcdir}${icons_dir}/AndroidMessages.png -t \
      ${pkgdir}${icons_dir}/
  done
}

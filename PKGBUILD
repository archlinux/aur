# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=android-messages-desktop-bin
pkgver=5.3.4
pkgrel=3
_electronversion=20
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=("electron${_electronversion}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/Android.Messages-v$pkgver-linux-x64.pacman"
        "$url/raw/v$pkgver/LICENSE"
        "${pkgname%-bin}"
        "${pkgname%-bin}.desktop")
sha256sums=('1b0ad72ac334600de804c5e505e2c4f3d56862e5060140a8816c4448003f4aa7'
            '3ad8e115711a8eca0050f768179efdca0f978b195a9c4f856a9d805628d3886c'
            'e7151555e8f57ab7c212aef1cc2312abc796fd6258713158c683eb5e099c7201'
            '1bf16b8864712b0c1de72d8c3764db14b75ecf64dae44d206a26aa036ac53b1a')

package() {
  install -d "$pkgdir/usr/lib/${pkgname%-bin}"
  cp -a "opt/Android Messages/resources" "$pkgdir/usr/lib/${pkgname%-bin}"

  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d ${pkgdir}${icons_dir}
    install -m644 ${srcdir}${icons_dir}/AndroidMessages.png \
      ${pkgdir}${icons_dir}/${pkgname%-bin}.png
  done
}

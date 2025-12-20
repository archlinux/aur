# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=noutube-bin
_app_id="jp.nonbili.${pkgname%-bin}"
pkgver=0.1.14
pkgrel=1
pkgdesc="YouTube and YouTube Music in a single app. No ads."
arch=('x86_64')
url="https://github.com/nonbili/NouTube-Desktop"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-linux-unpacked-$pkgver.zip::$url/releases/download/v$pkgver/linux-unpacked.zip"
        'NouTube.desktop')
noextract=("${pkgname%-bin}-linux-unpacked-$pkgver.zip")
sha256sums=('b44974468ba1b6d85a7c97fcf0c36f71bcfa37862eb106a9fbc40ad3efd01fbb'
            'cad129d2c27f89ddc6af0a63cb2e8257dda4185ccf5c9cfa083e8ebca073aed8')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "${pkgname%-bin}-linux-unpacked-$pkgver.zip" -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-bin}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/NouTube" "$pkgdir/usr/bin/"

  install -Dm644 "$srcdir/NouTube.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 dist/linux-unpacked/resources/app.asar.unpacked/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/NouTube.png"
}

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=noutube-bin
_app_id="jp.nonbili.${pkgname%-bin}"
pkgver=0.2.14
pkgrel=1
pkgdesc="YouTube and YouTube Music in a single app. No ads."
arch=('x86_64')
url="https://oss.nonbili.jp/noutube"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-linux-unpacked-$pkgver.zip::https://github.com/nonbili/NouTube-Desktop/releases/download/v$pkgver/linux-unpacked.zip"
        'NouTube.desktop')
noextract=("${pkgname%-bin}-linux-unpacked-$pkgver.zip")
sha256sums=('68d4f55de62cbe5c2122fc8ea170d40d0dfeae5083ea6cdb20113b3f582a5cc4'
            'cad129d2c27f89ddc6af0a63cb2e8257dda4185ccf5c9cfa083e8ebca073aed8')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "${pkgname%-bin}-linux-unpacked-$pkgver.zip" -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-bin}/"
  rm "$pkgdir/opt/${pkgname%-bin}/resources/app-update.yml"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/NouTube" "$pkgdir/usr/bin/"

  install -Dm644 "$srcdir/NouTube.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 dist/linux-unpacked/resources/app.asar.unpacked/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/NouTube.png"
}

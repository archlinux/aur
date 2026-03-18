# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=noutube-bin
_app_id="jp.nonbili.${pkgname%-bin}"
pkgver=0.2.5
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
sha256sums=('4f6773257c2adf8710e3e3c08b15d75b0f6cd6608803ec5107c4bb2ce381a756'
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

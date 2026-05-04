# Maintainer: junamat <plmauna@gmail.com>
pkgname=batch-beatmap-downloader-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A way to mass download osu! beatmaps with a user friendly query builder."
arch=('x86_64')
url="https://github.com/junamat/batch-beatmap-downloader"
license=('MIT')
#depends=('electron')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::https://github.com/junamat/batch-beatmap-downloader/releases/download/v${pkgver}/Batch.Beatmap.Downloader-linux-x64-${pkgver}.zip")
sha256sums=('d5065a000422f239f8f2b078ffddf25f657ef90203eaeeaaf85c686387d9fbcd')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/Batch Beatmap Downloader-linux-x64/"* "${pkgdir}/opt/batch-beatmap-downloader/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/batch-beatmap-downloader" "${pkgdir}/usr/bin/batch-beatmap-downloader"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Batch Beatmap Downloader
Comment=An easy way to mass download osu! beatmaps 
Exec=/usr/bin/batch-beatmap-downloader
Icon=/opt/${pkgname}/resources/bbd.png
Type=Application
Categories=Game;Utility;
EOF
}

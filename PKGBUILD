# Maintainer: junamat <plmauna@gmail.com>
pkgname=batch-beatmap-downloader-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A way to mass download osu! beatmaps with a user friendly query builder."
arch=('any')
url="https://github.com/junamat/batch-beatmap-downloader"
license=('MIT')
#depends=('electron')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::https://github.com/junamat/batch-beatmap-downloader/releases/download/v${pkgver}/Batch.Beatmap.Downloader-linux-x64-${pkgver}.zip")
sha256sums=('c2975088cba24444610bb9ab8466e858b20e6a7dbf25ea6dae01e7041193c897')

package() {
  install -dm755 "${pkgdir}/opt/batch-beatmap-downloader"
  cp -r "${srcdir}/Batch Beatmap Downloader-linux-x64/"* "${pkgdir}/opt/batch-beatmap-downloader/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/batch-beatmap-downloader/batch-beatmap-downloader" "${pkgdir}/usr/bin/batch-beatmap-downloader"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Batch Beatmap Downloader
Comment=An easy way to mass download osu! beatmaps 
Exec=/usr/bin/batch-beatmap-downloader
Icon=/opt/batch-beatmap-downloader/resources/bbd.png
Type=Application
Categories=Game;Utility;
EOF
}

# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An app that automatically downloads your anime from Anilist"
arch=('x86_64' 'aarch64')
url="https://github.com/icarosuper/AutoAnimeDownloader"
license=('GPL3')
depends=('qbittorrent')
source_x86_64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_x86.zip")
source_aarch64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_Arm64.zip")
sha256sums_x86_64=('e2892c8aca8699f81f678da2586e63834614cdc13c1f124de009c3c7767c075f')
sha256sums_aarch64=('a8c7725c0ec4c3bf4291e3d1f8ce21d12e80d2b8552e554e16189a62121bc844')

package() {
  cd "${srcdir}"
  
  install -Dm755 AutoAnimeDownloader-daemon "${pkgdir}/usr/bin/AutoAnimeDownloader-daemon"
  install -Dm755 AutoAnimeDownloader-cli "${pkgdir}/usr/bin/AutoAnimeDownloader-cli"
  
  install -Dm644 autoanimedownloader.service "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"
  
  sed -i 's|%h/.local/bin/AutoAnimeDownloader-daemon|/usr/bin/AutoAnimeDownloader-daemon|g' \
    "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"
}

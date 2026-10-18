# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="An app that automatically downloads your anime from Anilist"
arch=('x86_64' 'aarch64')
url="https://github.com/icarosuper/AutoAnimeDownloader"
license=('GPL3')
provides=('autoanimedownloader')
conflicts=('autoanimedownloader-git')
source_x86_64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_x86_v${pkgver}.zip")
source_aarch64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_Arm64_v${pkgver}.zip")
sha256sums_x86_64=('09f30230a11b98e99cad32b80f26f7b2cdb1129a08dc03fc8ee868b43d7ff6ad')
sha256sums_aarch64=('f2dbb2b6dc2d5f1b1d77bce5861d520d4115688336fcf0a879338fdb6127d8fb')

package() {
  if [[ "${CARCH}" == "aarch64" ]]; then
    cd "${srcdir}/AutoAnimeDownloader_Linux_Arm64_v${pkgver}"
  else
    cd "${srcdir}/AutoAnimeDownloader_Linux_x86_v${pkgver}"
  fi

  install -Dm755 autoanimedownloader-daemon "${pkgdir}/usr/bin/autoanimedownloader-daemon"
  install -Dm755 autoanimedownloader "${pkgdir}/usr/bin/autoanimedownloader"

  install -Dm644 autoanimedownloader.service "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"

  sed -i 's|%h/.local/bin/autoanimedownloader-daemon|/usr/bin/autoanimedownloader-daemon|g' \
    "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"

  install -Dm644 autoanimedownloader.desktop "${pkgdir}/usr/share/applications/autoanimedownloader.desktop"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/autoanimedownloader.png"
}

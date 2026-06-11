# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="An app that automatically downloads your anime from Anilist"
arch=('x86_64' 'aarch64')
url="https://github.com/icarosuper/AutoAnimeDownloader"
license=('GPL3')
depends=('qbittorrent')
provides=('autoanimedownloader')
conflicts=('autoanimedownloader-git')
source_x86_64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_x86_v1.3.3.zip")
source_aarch64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_Arm64_v1.3.3.zip")
sha256sums_x86_64=('f135ad1d2723508373485af1a2e6ef676c320f2ba8a1be07cd63d1be7d78d84d')
sha256sums_aarch64=('f953cab95d625810432f3d8b934a64991d8fae12a54954f1a5895eec3643e71a')

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

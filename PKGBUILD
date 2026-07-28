# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-bin
pkgver=1.3.4
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
sha256sums_x86_64=('36c75dbcf7760658e60cef35ff89fa7a72523d525870ea9a377b574c342d84b0')
sha256sums_aarch64=('e1c195f2c57c77f71904d62606615c9abb7cb4f50b0ca60597a5fe198aab4093')

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

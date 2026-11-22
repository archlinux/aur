# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-bin
pkgver=2.11.3
pkgrel=1
pkgdesc="An app that automatically downloads your anime from Anilist"
arch=('x86_64' 'aarch64')
url="https://github.com/icarosuper/AutoAnimeDownloader"
license=('GPL3')
provides=('autoanimedownloader')
conflicts=('autoanimedownloader-git')
source_x86_64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_x86_v${pkgver}.zip")
source_aarch64=("https://github.com/icarosuper/AutoAnimeDownloader/releases/download/v${pkgver}/AutoAnimeDownloader_Linux_Arm64_v${pkgver}.zip")
sha256sums_x86_64=('d1138f17720e8841bc4cdfee8c6c36cf949a6944862e9f6af33bcc2291220d35')
sha256sums_aarch64=('c02ba27e6a50f1e7cdde77a46787a9361ed953d3e918b61335a12147b3b22a20')

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

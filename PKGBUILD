# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion
_pkgname=quran-companion
pkgver=1.3.1
pkgrel=1
pkgdesc="Cross-platform desktop offline Quran reader and player (binary release)"
arch=('x86_64')
url="https://github.com/0xzer0x/quran-companion"
license=('LGPL3')
depends=(fuse2)
makedepends=()
provides=(quran-companion)
conflicts=(quran-companion-git)
source=("https://github.com/0xzer0x/quran-companion/releases/download/v${pkgver}/Quran_Companion-${pkgver}-x86_64.AppImage")
b2sums=("2ea14eb3054af294b2bf9a7c00cefdb10dc9462380c4a44112fa1c002ca5050ef842a6e76f4022e7ed59e512a1a51e0d3da2c60d259fd5e3f506d2f42c9c2511")
options=(!strip)
options=(!strip !debug)

prepare() {
  chmod +x "${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage"
  "${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage" --appimage-extract usr/share
}

package() {
  mkdir -p "${pkgdir}"/usr/{bin,share/{applications,metainfo,icons/hicolor/256x256/apps}}

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/squashfs-root/usr/share/applications/io.github._0xzer0x.qurancompanion.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/metainfo" "${srcdir}/squashfs-root/usr/share/metainfo/io.github._0xzer0x.qurancompanion.appdata.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/io.github._0xzer0x.qurancompanion.png"
  install -Dm755 "${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/quran-companion/quran_companion.AppImage"

  ln -sf /opt/quran-companion/quran_companion.AppImage "${pkgdir}/usr/bin/quran-companion"
}

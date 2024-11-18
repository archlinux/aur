# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion
_pkgname=quran-companion
pkgver=1.3.2
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
b2sums=("c2571fe6495c92c8b5e0d489d93d0d8f42b18dcccaa8c2acd782b456a6d3c0182307b9226d7532c5442e63835536d73374b19d6298a9e5eb463b2dda106e325d")
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

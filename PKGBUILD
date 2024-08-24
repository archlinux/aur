# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion
_pkgname=quran-companion
pkgver=1.2.9
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
b2sums=("d5fe8a5f985d732ec2f7f01b92d357d13c111d7de7fb7ffb81d0cd7dd5f5163e3ba3bdc6bf2a9aea997bdb4d93b499c2fe4502cae027b0f1e78125f2459d36a8")
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

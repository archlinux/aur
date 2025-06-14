# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion
_pkgname=quran-companion
pkgver=1.3.3
pkgrel=1
pkgdesc="Free and open-source desktop Quran reader and player (binary release)"
url="https://github.com/0xzer0x/quran-companion"
arch=('x86_64')
license=('LGPL3')
depends=(fuse2)
makedepends=()
provides=(quran-companion)
conflicts=(quran-companion-git)
source=("https://github.com/0xzer0x/quran-companion/releases/download/v${pkgver}/Quran_Companion-${pkgver}-x86_64.AppImage")
b2sums=("d1683c2f1bcf1ad334409eb184286a63a175277d7370eeea8223335e7ed01e0868a3138ec4cb9892ddc1660745c6f83d7520fe3c13ba635bc7b16f42e24d2b57")
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

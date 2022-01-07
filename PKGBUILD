# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

# Past Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Past Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Past Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.3.2
pkgrel=1
pkgdesc="The desktop version of your favorite mailsuite!"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/"

source=("https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v${pkgver}.AppImage"
        "zoho-mail-desktop.desktop")
sha256sums=("d57b105779c2e33e6df5426bdcab05ec0db8e311adbbcd0f2bb38c982d11fcca"
            "7be356bb7774e196b33eaeb9c2f641023c72961c00158f753777dc6135240324")

prepare() {
  chmod +x "zoho-mail-desktop-x64-v${pkgver}.AppImage"
  ./"zoho-mail-desktop-x64-v${pkgver}.AppImage" --appimage-extract
}

package() {
  mkdir -p "${pkgdir}/opt/zoho-mail-desktop"
  cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt/zoho-mail-desktop"

  mkdir -p "${pkgdir}/usr/bin"
  echo '#!/usr/bin/env bash
       gtk-launch zoho-mail-desktop.desktop' | tee "${pkgdir}/usr/bin/zoho-mail-desktop"
  chmod +x "${pkgdir}/usr/bin/zoho-mail-desktop"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp -Lr "${srcdir}/zoho-mail-desktop.desktop" "${pkgdir}/usr/share/applications"

  for img in 1024x1024 128x128 16x16 256x256 32x32 48x48 512x512 64x64; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${img}/apps"
    cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/${img}/apps/zoho-mail-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${img}/apps/"
  done
}

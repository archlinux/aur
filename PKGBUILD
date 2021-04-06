# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Past Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Past Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.2.0
pkgrel=10
pkgdesc="The desktop version of your favorite mailsuite!"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/"

source=("https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v${pkgver}.AppImage"
        "zoho-mail-desktop.desktop")
sha256sums=("SKIP"
            "SKIP")

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

  for img in 1024x1024 128x128 16x16 24x24 256x256 32x32 48x48 512x512 64x64 96x96; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${img}/apps"
    cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/${img}/apps/zoho-mail-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${img}/apps/"
  done
}

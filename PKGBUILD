# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=jellyfin-desktop-bin
pkgver=0.r807.3f2eb84
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-desktop'
makedepends=('unzip')
source=("https://nightly.link/jellyfin/jellyfin-desktop/workflows/build-linux-appimage/main/linux-appimage-x86_64.zip")

sha256sums=('af9c435fba1d15a3b6e3e3dca465121b37a54f4c844fd72c3aae817010ad99a9')

prepare() {
   unzip -nq linux-appimage-x86_64.zip
   chmod +x ./JellyfinDesktop-3.0.0-dev+d2669e6-x86_64.AppImage
   ./JellyfinDesktop-3.0.0-dev+d2669e6-x86_64.AppImage --appimage-extract 2>&1 >/dev/null
}

package() {
   install -d "${pkgdir}/usr/bin/"
   install -d "${pkgdir}/usr/lib/jellyfin-desktop/"
   install -d "${pkgdir}/usr/share/applications/"
   install -d "${pkgdir}/usr/share/icons/"

   install -m644 "squashfs-root/org.jellyfin.JellyfinDesktop.svg" "${pkgdir}/usr/share/icons/"
   install -m644 "squashfs-root/org.jellyfin.JellyfinDesktop.desktop" "${pkgdir}/usr/share/applications"

   chmod 755 -R squashfs-root
   mv squashfs-root/* "${pkgdir}/usr/lib/jellyfin-desktop/"
   ln -s "/usr/lib/jellyfin-desktop/AppRun" "${pkgdir}/usr/bin/jellyfin-desktop"
}

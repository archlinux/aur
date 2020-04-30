# Maintainer: Julius Dehner <julius.dehner@protonmail.com>

pkgname=plexamp-appimg
pkgver=3.0.2
pkgrel=0
pkgdesc="Music focused client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
url="https://plexamp.plex.tv"
options=(!strip)
_desktop_name=plexamp.desktop
source=(
  ${url}/plexamp.plex.tv/desktop/Plexamp-${pkgver}.AppImage
)
sha512sums=(
  SKIP
)

package() {
  echo "Starting install"
  chmod +x ./Plexamp-${pkgver}.AppImage
  ./Plexamp-${pkgver}.AppImage --appimage-extract plexamp.desktop
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Plexamp.AppImage|" squashfs-root/${_desktop_name}
  install -Dm755 Plexamp-${pkgver}.AppImage "$pkgdir"/usr/bin/Plexamp.AppImage
  echo "Installing desktop launch file to $pkgdir/usr/bin/Plexamp.AppImage"
  install -Dm755 squashfs-root/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
}

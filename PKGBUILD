# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalipso from a published version. The release workflow writes pkgver and the source fingerprint and
# pushes this file to AUR; in the repository it is the template.

pkgname=kalipso
pkgver=3.0
pkgrel=1
pkgdesc='Teleprompter that keeps your place: follows your voice on your computer, scrolls at a steady pace or waits for your pedal'
arch=('x86_64')
url='https://sansevieria-ou.github.io/kalipso/'
license=('LicenseRef-SANSEVIERIA-1.0' 'AGPL-3.0-or-later')
# pipewire: pw-record captures the microphone.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libpipewire' 'libstdc++' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'ninja' 'python' 'qt6-tools')
optdepends=('plasma-workspace: the Plasma widget and the KWin script'
            'gnome-shell: the GNOME Shell extension'
            'xdg-desktop-portal: reader colours from the window behind')
source=("kalipso-$pkgver.tar.gz::https://github.com/SANSEVIERIA-OU/kalipso/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5aee11be2e1b94560feba7525f01e77cd651eb9c40e060df8d38747fefc94409')

build() {
  cmake -S "kalipso-$pkgver" -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  # The app, the companion, the Plasma widget, the GNOME Shell extension and the KWin script.
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalipso from a published version. The release workflow writes pkgver and the source fingerprint and
# pushes this file to AUR; in the repository it is the template.

pkgname=kalipso
pkgver=2.2
pkgrel=1
pkgdesc='Teleprompter that keeps your place: follows your voice on your computer, scrolls at a steady pace or waits for your pedal'
arch=('x86_64')
url='https://sansevieria-ou.github.io/kalipso/'
license=('AGPL-3.0-or-later')
# pipewire: pw-record captures the microphone.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libpipewire' 'libstdc++' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'ninja' 'python' 'qt6-tools')
optdepends=('plasma-workspace: the Plasma widget and the KWin script'
            'gnome-shell: the GNOME Shell extension'
            'xdg-desktop-portal: reader colours from the window behind')
source=("kalipso-$pkgver.tar.gz::https://github.com/SANSEVIERIA-OU/kalipso/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68b2e1cbc01a34c1b07498b4b8f0711d878dc9bff90ed96c75c026b555c8012d')

build() {
  cmake -S "kalipso-$pkgver" -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  # The app, the companion, the Plasma widget, the GNOME Shell extension and the KWin script.
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Javier Carracedo <https://github.com/vircon32>
# Contributor: DeathKhan <jfoh96@gmail.com>
# Contributor: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=vircon32-desktop-emulator-git
pkgver=24.8.30.r0.gc83283b
pkgrel=1
pkgdesc="Vircon32 Desktop Emulator"
arch=(x86_64)
url="http://www.vircon32.com/"
license=(BSD)
depends=(mesa sdl2 sdl2_image openal freealut tinyxml2 gtk2)
makedepends=(glibc git cmake)
provides=(vircon32-desktop-emulator)
source=("vircon32::git+https://github.com/vircon32/ComputerSoftware.git")
sha256sums=('SKIP')
_commit=c83283bc519bebcba235de30ff16d605b3f0be74

pkgver() {
  cd vircon32
  git describe --long --tags --exclude devtools* | sed 's/^emulator-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S vircon32/DesktopEmulator
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D vircon32/DesktopEmulator/Data/Readme.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Adding a Valid Desktop Entry for Vircon32
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Name=Vircon32" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Comment=Vircon32, a 32-bit virtual game console" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Exec=/usr/local/Vircon32/Emulator/Vircon32" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Icon=/usr/share/icons/hicolor/scalable/apps/Vircon32.svg" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
  echo "Version=24.8.30" >> "${pkgdir}/usr/share/applications/Vircon32.desktop"
}

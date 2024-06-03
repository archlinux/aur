# Maintainer: Javier Carracedo <https://github.com/vircon32>
# Contributor: DeathKhan <jfoh96@gmail.com>
# Contributor: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=vircon32-desktop-emulator-git
pkgver=37500869bac26fbc883baf476d3a5e62fdbb5896
pkgrel=1
epoch=20240603
pkgdesc="Vircon32 Desktop Emulator"
arch=('x86_64')
url="https://github.com/vircon32/ComputerSoftware"
license=('BSD')
depends=('mesa' 'sdl2' 'sdl2_image' 'openal' 'freealut' 'tinyxml2' 'gtk2')
makedepends=('glibc' 'git' 'cmake')
provides=('vircon32-desktop-emulator')
source=("ComputerSoftware::git+$url.git")
sha256sums=('SKIP')

build() {
  cd ComputerSoftware/DesktopEmulator
  mkdir build && cd build
  cmake ..
  cmake --build .
}

package() {
  install -d "${pkgdir}/opt/Vircon32/Emulator"
  install -d "${pkgdir}/opt/Vircon32/Emulator/Bios"
  install -d "${pkgdir}/opt/Vircon32/Emulator/Images"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  cp -r ComputerSoftware/DesktopEmulator/build/* "${pkgdir}/opt/Vircon32/Emulator"
  cp ComputerSoftware/DesktopEmulator/Data/Config-Controls.xml "${pkgdir}/opt/Vircon32/Emulator"
  cp ComputerSoftware/DesktopEmulator/Data/Config-Settings.xml "${pkgdir}/opt/Vircon32/Emulator"
  cp ComputerSoftware/DesktopEmulator/Data/Bios/StandardBios.v32 "${pkgdir}/opt/Vircon32/Emulator/Bios/StandardBios.v32"
  cp ComputerSoftware/DesktopEmulator/Data/GuiFont.ttf "${pkgdir}/opt/Vircon32/Emulator"
  cp -r ComputerSoftware/DesktopEmulator/Data/Images/* "${pkgdir}/opt/Vircon32/Emulator/Images"
  cp ComputerSoftware/DesktopEmulator/Resources/Linux/Vircon32.desktop "${pkgdir}/usr/share/applications"
  cp ComputerSoftware/DesktopEmulator/Resources/Linux/Vircon32.svg "${pkgdir}/usr/share/pixmaps"
  cp ComputerSoftware/DesktopEmulator/Resources/Linux/Vircon32.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}

# Maintainer: Rooki  <aur at rooki dot xyz>

pkgname=thrive-launcher-bin
pkgver=2.2.1
pkgrel=2
pkgdesc="Thrive Launcher for installing and automatically updating Thrive."
arch=(x86_64)
url="https://revolutionarygamesstudio.com"
license=(custom MIT)
depends=(glibc zlib libxi libxinerama libxrender libxcursor libxext libglvnd libxrandr libx11)
provides=(thrive-launcher)
conflicts=(thrive-launcher)
source_x86_64=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v${pkgver%.0}/ThriveLauncher_${pkgver}_linux_standalone.7z")
sha256sums_x86_64=('cea449864e82ea35e7abb692da6e3733bdf93f90257f011536b0274addde6850')
options=(!strip)

prepare() {
  mv "ThriveLauncher_${pkgver}_linux"/ThriveLauncher.desktop .
  mv "ThriveLauncher_${pkgver}_linux"/thrive-launcher-icon.png .
  sed s,Exec=ThriveLauncher,Exec=/opt/thrivelauncher/ThriveLauncher, -i ThriveLauncher.desktop
}

package() {
  install -dm755 --group games "$pkgdir/opt/thrivelauncher"
  cp -r "ThriveLauncher_${pkgver}_linux"/* "$pkgdir/opt/thrivelauncher"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/thrivelauncher/ThriveLauncher" "${pkgdir}/usr/bin/thrivelauncher"

  install -D -t "${pkgdir}/usr/share/icons/" thrive-launcher-icon.png
  install -D -t "${pkgdir}/usr/share/applications" ThriveLauncher.desktop

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrivelauncher/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}

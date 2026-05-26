# Maintainer: Rooki  <aur at rooki dot xyz>

pkgname=thrive-launcher-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Thrive Launcher for installing and automatically updating Thrive."
arch=(x86_64)
url="https://revolutionarygamesstudio.com"
license=(custom MIT)
depends=(glibc zlib libxi libxinerama libxrender libxcursor libxext libglvnd libxrandr libx11)
provides=(thrive-launcher)
conflicts=(thrive-launcher)
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v${pkgver}/ThriveLauncher_${pkgver}_linux_standalone.7z")
sha256sums=('b412e9f08f795008071437dd1dd9bba61fec552229c85e35606e5d81de31527e')
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
  install -Dm644 "${pkgdir}/opt/thrivelauncher/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}

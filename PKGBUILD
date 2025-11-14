# Maintainer: Rooki  <aur at rooki dot xyz>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Sebastien Duthil

pkgname=thrive-bin
pkgver=0.9.0.1
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=(x86_64)
url="https://revolutionarygamesstudio.com"
license=(GPL3 'CCPL:cc-by-sa-3.0' custom)
depends=(glibc zlib libxi libxinerama libxrender libxcursor libxext libglvnd libxrandr libx11)
provides=(thrive)
conflicts=(thrive)
source=(thrive.sh)
source_x86_64=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('6ec074bbee0ac3f21e51e41247f376e2684ab1215ac2e0346af632d5b94f688d')
sha256sums_x86_64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
options=(!strip)

prepare() {
  mv "Thrive_${pkgver}_linux_x11"/Thrive.{desktop,png} .
  sed s,Exec=Thrive,Exec=/opt/thrive/Thrive, -i Thrive.desktop
}

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/thrive/Thrive" "${pkgdir}/usr/bin/thrive"

  install -D -t "${pkgdir}/usr/share/icons/" Thrive.png
  install -D -t "${pkgdir}/usr/share/applications" Thrive.desktop

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrive/GodotLicense.txt"        "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrive/gpl.txt"                 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrive/LICENSE.txt"             "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrive/ThriveAssetsLICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644  "${pkgdir}/opt/thrive/ThriveAssetsREADME.txt"  "${pkgdir}/usr/share/licenses/${pkgname}"
}

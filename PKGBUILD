# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Sebastien Duthil

pkgname=thrive-bin
pkgver=0.6.3.0
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=(x86_64)
url="https://revolutionarygamesstudio.com"
license=(GPL3 'CCPL:cc-by-sa-3.0' custom)
depends=(glibc zlib libxi libxinerama libxrender libxcursor libxext libglvnd libxrandr libx11)
provides=(thrive)
conflicts=(thrive)
source_x86_64=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums_x86_64=('e8d55abbbf46c52d08b6e5d86d9b33efdc54796d39c645bd48823fb1756769dd')

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
  mv "${pkgdir}/opt/thrive/GodotLicense.txt"        "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/thrive/gpl.txt"                 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/thrive/LICENSE.txt"             "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/thrive/ThriveAssetsLICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/thrive/ThriveAssetsREADME.txt"  "${pkgdir}/usr/share/licenses/${pkgname}"
}

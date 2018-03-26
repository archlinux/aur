# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
_pkgbasename=mqttfx
pkgver=1.6.0
pkgrel=2
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=("x86_64")
url="http://mqttfx.org"
license=("Apache")
depends=("java-runtime" "java-openjfx")
options=("!strip" "!upx")
source=(
  "http://www.jensd.de/apps/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}-linux.deb"
  "${_pkgbasename}.desktop")
sha256sums=(
  "2a4f11f1a599471be34486a6e7443052dd0548ba5750ef380c81bdfb4efdcef9"
  "27abc38d59d94d1d8e8e171d1d15d392fd65774d89235be734145ae4c50c6c0b"
)

package() {
  cd "${srcdir}"

  # Extract the application data into the package directory root
  tar -xzf data.tar.gz -C "${pkgdir}"

  # Install the binary directory and link into package
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbasename}/${_pkgbasename}" "${pkgdir}/usr/bin/${_pkgbasename}"

  # Install the application logo icon and desktop launcher
  install -Dm644 "${pkgdir}/opt/${_pkgbasename}/.install4j/${_pkgbasename}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgbasename}.png"
  install -Dm644 "${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}

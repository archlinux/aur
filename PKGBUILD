# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams
pkgver=1.5.00.23861
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365"
arch=('x86_64')
url="https://teams.microsoft.com/downloads"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("libappindicator-gtk3: Systray indicator support"
  "org.freedesktop.secrets: Keyring password store support")
conflicts=("ms-teams")
replaces=("ms-teams")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('fb989e0f6fcf65aad52586de83a1c6da2f7a8c3d7509f3c09fec61a6a3a83660df47284c5c76964eb845441e294a0c4e29517aa0b9df1c4356efed1e1bd1a50d')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

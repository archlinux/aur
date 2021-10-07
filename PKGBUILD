# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams
pkgver=1.4.00.26453
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
sha256sums=('ee15b57793aa6b79ccda744d5232da670335abd931bae2a020f5043a129ab859')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

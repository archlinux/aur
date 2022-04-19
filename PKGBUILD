# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams
pkgver=1.5.00.10453
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
b2sums=('f9570bedd12dc9113c956d0b9c34c4124939b0a855f73a7611ce640b00fd4a7d8288af94aa3f087482040619c11f79a144e2292dd853254fe4f55fe694165a26')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

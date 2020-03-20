# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams
pkgver=1.3.00.5153
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365"
arch=('x86_64')
url="https://teams.microsoft.com/downloads"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets")
conflicts=("ms-teams" "teams-insiders")
replaces=("ms-teams")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('c928d01831b2ae9afd871172a6b56edf1d1c848655482973358f3d206375878d')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

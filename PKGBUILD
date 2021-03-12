# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams-insiders
pkgver=1.4.00.4855
pkgrel=2
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365 - Insiders Version"
arch=('x86_64')
url="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/${pkgname}_${pkgver}_amd64.deb"
        "${pkgname}.patch")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('36f7055f1cc7d4ec6dee040a49798cd18c8b0bb4e519372230561ef06302cc7e'
            '02c815cd33684efec7ef2ad38ff95539f222223a0c6b9b73c28a959123e59ad1')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix the order of items in the startup script so that the meeting links will work again
  patch -d "${pkgdir}" -p1 <"${pkgname}".patch

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

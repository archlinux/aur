# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=ieumoffice-bin
_name=IeumOffice
pkgver=0.12.12
pkgrel=1
pkgdesc='IeumOffice - desktop office suite for DOCX/XLSX/PPTX/PDF/HWP/Markdown (prebuilt binary)'
arch=('x86_64')
url='https://ieumoffice.com'
_gh='https://github.com/pblsketch/openoffice'
license=('Apache-2.0')
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib' 'libxtst'
         'at-spi2-core' 'cups' 'libdrm' 'mesa' 'libxkbcommon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')
source=("https://github.com/pblsketch/openoffice/releases/download/v0.12.12/ieumoffice-0.12.12.x86_64.rpm"
        "https://raw.githubusercontent.com/pblsketch/openoffice/v0.12.12/LICENSE"
)
sha512sums=('171ec15f88feddf6651d6b71338790eefd3a8221fe8accdbe3f606f8dc0f0ced3d3f4abe6bd089cc155dcf9ff950be00e732701f5f11451fb9ef45c6c684e17b'
            'e351f5ca50c8c31fb7c97043090d20afe7a3a1d725123f3e811236b7a83b1e7f2443ebf58e2cbd229e2b8d5a9ebc8c04c7c06bdacb8fa88973b9aaf1696e8811'
)

package() {
  bsdtar -xf "${srcdir}/ieumoffice-${pkgver}.x86_64.rpm" -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # CLI on PATH
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_name}/ieumoffice" "${pkgdir}/usr/bin/ieumoffice"

  # .desktop: point to PATH binary so the app is discoverable without absolute /opt path
  sed -i "s|^Exec=.*|Exec=/usr/bin/ieumoffice %U|" \
    "${pkgdir}/usr/share/applications/ieumoffice.desktop"
}

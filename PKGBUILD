# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=ieumoffice-bin
_name=IeumOffice
pkgver=0.12.10
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
source=("https://github.com/pblsketch/openoffice/releases/download/v0.12.10/ieumoffice-0.12.10.x86_64.rpm"
        "https://raw.githubusercontent.com/pblsketch/openoffice/v0.12.10/LICENSE"
)
sha512sums=('cf3ae5c92e4c6e80674756f234dd7eb5c0818d3674582b32930a4468aa45bc0d3dc9de5b821717bc5182d91f7c692e961e4ff2c775cc37f3a53171b58d626934'
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

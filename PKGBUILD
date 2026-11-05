# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=ieumoffice-bin
_name=IeumOffice
pkgver=0.12.11
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
source=("https://github.com/pblsketch/openoffice/releases/download/v0.12.11/ieumoffice-0.12.11.x86_64.rpm"
        "https://raw.githubusercontent.com/pblsketch/openoffice/v0.12.11/LICENSE"
)
sha512sums=('866e3d80562de8523b09af6d627997cc66fb7f811af908a55827d83d59ed34b165309f8eafa80e191111bc851f27de20818ddd17a75dc952cf00e8892d0136b2'
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

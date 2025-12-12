_pkgname=api-calls
pkgname="${_pkgname}-bin"
pkgver=0.15.0
pkgrel=1
pkgdesc="Simple application to call and test REST APIs"
arch=('x86_64')
url="https://github.com/elpeix/apicalls"
license=('GPLv3')

# Dev source
# source=(
#   "${_pkgname}-${pkgver}.tar.xz"
#   "${_pkgname}.desktop"
#   "${_pkgname}.png"
#   "${_pkgname}.sh"
#   "LICENSE-${pkgver}"
# )

# Release source
source=(
  "${_pkgname}-${pkgver}.tar.xz::https://github.com/elpeix/apicalls/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz"
  "${_pkgname}-${pkgver}.desktop::https://raw.githubusercontent.com/elpeix/apicalls/v${pkgver}/aur/${_pkgname}.desktop"
  "${_pkgname}-${pkgver}.png::https://raw.githubusercontent.com/elpeix/apicalls/v${pkgver}/aur/${_pkgname}.png"
  "${_pkgname}-${pkgver}.sh::https://raw.githubusercontent.com/elpeix/apicalls/v${pkgver}/aur/${_pkgname}.sh"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/elpeix/apicalls/v${pkgver}/LICENSE"
)
sha256sums=("492add04095c9d459c6cc8411a60e8a4345e5db81e03be2d47b6570d95f55fa6" "056d6bc11fd8fa9fdbd9460a5a1a8dab4254751d28fb3857194be45d0f51a673" "581195c48c61f557d6011e28e1b73744c53c2511b844ea85ede40ef2fa146e27" "6caf04ab572e54edbe2ce69ea035a92f22ae328d1b44769f792930bbd7931c34" "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986")

package() {
  # Extract xz file
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}"
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.tar.xz" -C "${srcdir}"

  # Remove old files
  rm -rf "${pkgdir}/usr/share/${_pkgname}"
  rm -rf "${pkgdir}/usr/bin/${_pkgname}"
  rm -rf "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm -rf "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Create the package directory
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"

  # Copy the files to the package directory
  cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/share/${_pkgname}/"

  # Install sh
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop file
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install to the icon
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Install to the license file
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

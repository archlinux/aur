# Maintainer:

pkgbase="otf-typodermic-free"
pkgname=(
  "otf-typodermic-free"
  "otf-typodermic-pd"
)
pkgver=2023.01
pkgrel=1
pkgdesc="Free Fonts from Typodermic"
url="https://typodermicfonts.com/downloads/"
license=('custom')
arch=('any')

_file_free="typodermic-free-fonts-2023a.zip"
_file_pd="typodermic-public-domain-2022-11.zip"
noextract=(
  "$_file_free"
  "$_file_pd"
)
source=(
  "https://typodermicfonts.com/wp-content/uploads/2023/01/$_file_free"
  "https://typodermicfonts.com/wp-content/uploads/2022/11/$_file_pd"
)
sha256sums=(
  'edf18de41bc601a276e65472804ee558536dc030056034a32f591de46569f278'
  'a774627da6d95b4ad0fda103dad126099b2f3d910281f6b4155e5a712627c8ba'
)

_package() {
  local _archive="${1:?}"

  mkdir -p "${pkgname:?}"
  bsdtar -x -C "${pkgname:?}" -f "$_archive"

  install -Dm644 "${pkgname:?}"/*/*.otf -t "${pkgdir:?}/usr/share/fonts/${pkgname#*-}/"
}

package_otf-typodermic-free() {
  _package "$_file_free"

  install -Dm644 "${pkgname:?}/Typodermic Desktop EULA 2023.pdf" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}

package_otf-typodermic-pd() {
  pkgdesc+=" - public domain"

  _package "$_file_pd"

  install -Dm644 "${pkgname:?}/License.txt" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"
}


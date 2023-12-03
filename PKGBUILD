# Maintainer: Sakari <sk308269317@outlook.com>

_pkgname=maa-assistant-arknights
_pkgdirname=maa
pkgname="${_pkgname}"-bin
_pkgver=v4.28.0-beta.1
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="A one-click tool for the daily tasks of Arknights, supporting all clients."
arch=('x86_64' 'aarch64')
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
provides=('maa')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'sed'
)
source=(
  'maa-bin.sh'
  'maa.desktop'
  'maa.png::https://github.com/MaaAssistantArknights/design/raw/b390f657766b6ce3a2ea1929fa8f18367cc30efe/logo/maa-logo_512x512.png'
  'https://github.com/MaaAssistantArknights/MaaAssistantArknights/raw/27fc4a6bf68f62cb6e9e5d2cf1f9d671112a38dd/LICENSE'
)

sha256sums=('92e21c4a6b3b254329ae43c600c74654752cd818a948492e15c5cdd9507818d0'
  'a0e767edc532186de42d3f8235fd76c96d2991ee73ad495baa34638e8379dac5'
  'f404ffe0af05122c8b3097fe89c30bbd9cd94d6228036dd902f26a79ed373592'
  '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('60e0131888a40c23743918701a29b7a15b8a63aca9b1af362483027a52eb1d17')
sha256sums_aarch64=('5ad55cf602b1f9a70b3ff05a825bdc461daeaada8bb7577216947b5e10dfbaba')

source_x86_64=("${url}/releases/download/${_pkgver}/MAA-${_pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${_pkgver}/MAA-${_pkgver}-linux-aarch64.tar.gz")
_pkg="MAA-${_pkgver}-linux-x86_64"
if [ "${CARCH}" = "aarch64" ]; then
  _pkg="MAA-${_pkgver}-linux-aarch64"
fi
noextract=(
  "MAA-${_pkgver}-linux-x86_64.tar.gz"
  "MAA-${_pkgver}-linux-aarch64.tar.gz"
)

prepare() {
  mkdir -p ${_pkg}
  tar xf ${_pkg}.tar.gz -C ${_pkg}
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgdirname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/licenses/${_pkgdirname}"

  install -m755 "${srcdir}/maa-bin.sh" "${pkgdir}/usr/bin/maa"
  install -m644 "${srcdir}/maa.desktop" "${pkgdir}/usr/share/applications/maa.desktop"
  install -m644 "${srcdir}/maa.png" "${pkgdir}/usr/share/icons/maa.png"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgdirname}/LICENSE"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgdirname}"

}

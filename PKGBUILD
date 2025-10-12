# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tcp_pubsub"
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=2
pkgdesc="TCP based publish-subscribe library for C++"
arch=('x86_64')
url="https://github.com/eclipse-ecal/${_pkgname}"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
  "lib${_pkgname}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgsrc}-ubuntu-24.04-shared.deb")
noextract=("${source_x86_64[@]%%::*}")
sha256sums=('5454720e943c596f0436639ece2f0431a5f793827e2ef72aa49556ac9a4d6651'
            '5d13d80e899053bbc052aa83842f137dfbfa2be1e812444b3dae423330780cab')
sha256sums_x86_64=('4bca6df86c83f15026356a5b10c4e754959e9e4494502deed1537ad10922034c')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${_pkgsrc}-${CARCH}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

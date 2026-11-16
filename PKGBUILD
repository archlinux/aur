# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit
_pkgname=wuyou-toolkit
pkgver=0.6.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('NOASSERTION')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("wuyou-toolkit-bin=${pkgver}")
options=('!strip')
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('c37d7091cf707066002d2832c30d6b63c7083c5994a64b7caa0d0f6bf8252aaf')
sha256sums_aarch64=('c201808657e6f91fcc66c9cc177a2036c03d256c7e1be1082e4d8264640da4af')

package() {
  local _deb_arch _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  case "${CARCH}" in
    x86_64) _deb_arch='amd64' ;;
    aarch64) _deb_arch='arm64' ;;
  esac

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_${_deb_arch}.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Toolkit/'     -e 's/^Comment=.*/Comment=Cross-platform desktop toolbox/'     -e 's/^Categories=.*/Categories=Utility;Development;/'     "${pkgdir}/usr/share/applications/wuyou-toolkit.desktop"
}

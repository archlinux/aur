# Maintainer: Leonardo Panseri <leonardo.panseri+aur@gmail.com>

pkgname=cosmic-ext-applet-minimon-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Customizable system monitor applet for COSMIC'
arch=('x86_64')
url='https://github.com/cosmic-utils/minimon-applet'
license=('GPL-3.0-only')
depends=(
  'glibc'
  'gcc-libs'
  'libxkbcommon'
)
provides=('cosmic-ext-applet-minimon')
conflicts=('cosmic-ext-applet-minimon')
options=('!strip')
_asset="cosmic-ext-applet-minimon-1.2.0-1.fc44.x86_64.rpm"
source_x86_64=("${_asset}::${url}/releases/download/v${pkgver}/${_asset}")
sha256sums_x86_64=('b9245ed78d15931d4b0d71dd25db15b88cf0efd64733d5f02262584716bb3774')
noextract=("${_asset}")

package() {
  case "${_asset}" in
    *.rpm)
      bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}" ./usr
      ;;
    *.deb)
      bsdtar -xOf "${srcdir}/${_asset}" data.tar.* | bsdtar -xpf - -C "${pkgdir}" ./usr
      ;;
  esac
}

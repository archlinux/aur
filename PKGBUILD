# Maintainer: Leonardo Panseri <leonardo.panseri+aur@gmail.com>

pkgname=cosmic-ext-applet-minimon-bin
pkgver=1.1.2
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
_asset="cosmic-ext-applet-minimon-1.1.2-1.fc44.x86_64.rpm"
source_x86_64=("${_asset}::${url}/releases/download/v${pkgver}/${_asset}")
sha256sums_x86_64=('bf02991044939886bb3421fb22b7082c19ef561752f7304f91b2a7a66594c76a')
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

# Maintainer: duanluan <duanluan@outlook.com>

pkgname=keyviz-zh-bin
_pkgname=keyviz
pkgver=2.1.0
pkgrel=1
pkgdesc='Chinese-localized fork of Keyviz (prebuilt binary)'
arch=('x86_64')
url='https://github.com/zetaloop/keyviz'
license=('GPL3')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
provides=('keyviz')
conflicts=('keyviz' 'keyviz-bin' 'keyviz-cn-bin')
options=('!strip')
_asset='keyviz_2.1.0_amd64.deb'
source=(
  "${_asset}::https://github.com/zetaloop/keyviz/releases/download/v2.1.0/keyviz_2.1.0_amd64.deb"
)
noextract=("${_asset}")
sha256sums=(
  '08db31926afb45cd6fde0aa29428ad621513825050cc44ccd2e5cf9de5a607f7'
)

package() {
  local _builddir
  _builddir="$(mktemp -d)"
  trap 'rm -rf "${_builddir}"' EXIT

  bsdtar -C "${_builddir}" -xf "${srcdir}/${_asset}"
  bsdtar -C "${pkgdir}" -xf "${_builddir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Keyviz ZH/'     -e 's/^Comment=.*/Comment=Chinese-localized Keyviz/'     -e 's/^Categories=.*/Categories=Utility;/'     "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

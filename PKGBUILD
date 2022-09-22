# Maintainer: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=31
_commit=67a892d
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('3660ae09c00837fdf0e88cc400a83cdd11b88830a00691ab491903840ab282a5')

build() {
  cd "${_pkgbase}-${_commit}"
  # The envvar LANG is used to localize pot file.
  make LANG=${LANG} mergepo \
    && make VERSION="${pkgver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR="${pkgdir}" install
  # Patch for 42
  sed -i '/"43"/i \ \ \ \ "42",' \
    ${pkgdir}/usr/share/gnome-shell/extensions/color-picker@tuberry/metadata.json
}

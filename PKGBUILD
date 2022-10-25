# Maintainer: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=32
_commit=0775a86
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('4e81fa9bd41a8d58465208250ba433a496239fa5a26b1b4108b2ecda6c09bf05')

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

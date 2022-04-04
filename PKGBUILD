# Maintainer: skrewball <jason at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=27
_commit=b84de1f
pkgrel=4
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:41')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('5a9c8844fe05b12d21f1b8c9659cbc1f638334c97f8320d7a407acd36495f699')

build() {
  cd "${_pkgbase}-${_commit}"
  # The envvar LANG is used to localize pot file.
  make LANG=${LANG} mergepo \
    && make VERSION="${pkgver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR="${pkgdir}" install
}

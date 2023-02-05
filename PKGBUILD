# Maintainer: Arpan Kapoor <a at arpankapoor.com>

_reponame=gnome-bluetooth-quick-connect
pkgname=gnome-shell-extension-bluetooth-quick-connect-git
pkgver=31.r5.g66b79fc
pkgrel=2
pkgdesc='Allow to connect Bluetooth paired devices from GNOME control panel.'
arch=('any')
url="https://github.com/bjarosze/${_reponame}"
license=('GPL3')
depends=('gnome-shell' 'bluez-utils')
makedepends=('git')
source=("git+https://github.com/bjarosze/${_reponame}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_reponame}"
  make
}

package() {
  cd "${srcdir}/${_reponame}"
  local uuid='bluetooth-quick-connect@bjarosze.gmail.com'
  local dir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  mkdir -p "${dir}" __extract
  bsdtar -xvf "${srcdir}/${_reponame}/${uuid}.shell-extension.zip" -C __extract
  cp -R __extract/* "${dir}"
}

pkgver() {
  cd "${_reponame}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

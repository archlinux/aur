# Maintainer: Arpan Kapoor <a at arpankapoor.com>

_reponame=gnome-bluetooth-quick-connect
pkgname=gnome-shell-extension-bluetooth-quick-connect-git
pkgver=31.r5.g66b79fc
pkgrel=1
pkgdesc='Allow to connect bluetooth paired devices from gnome control panel'
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
  glib-compile-schemas --strict --targetdir=schemas schemas
}

package() {
  cd "${srcdir}/${_reponame}"
  local dir="${pkgdir}/usr/share/gnome-shell/extensions/bluetooth-quick-connect@bjarosze.gmail.com"
  mkdir -p "${dir}"
  cp -R * "${dir}"
}

pkgver() {
  cd "${_reponame}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

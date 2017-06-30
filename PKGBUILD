# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-bumblebee-status-git
_gitname=gnome-shell-extension-bumblebee-status
pkgver=9.9cc6f3a
pkgrel=1
pkgdesc="GNOME Shell extension that shows the status of the NVIDIA GPU"
arch=('any')
url="https://github.com/dsboger/gnome-shell-extension-bumblebee-status"
license=('GPL3')
depends=('gnome-shell' 'unzip')
makedepends=('git')
source=('git+https://github.com/dsboger/gnome-shell-extension-bumblebee-status.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make ${MAKEFLAGS} zip-file
}

package() {
  cd $_gitname
  _extid="gnome-shell-extension-bumblebee-status.dsboger@gmail.com"
  _extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
  install -dm755 "${_extpath}"
  unzip -q -d "${_extpath}" "${_gitname}.zip"
}

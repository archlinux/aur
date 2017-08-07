# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-cpupower-git
_gitname=cpupower
pkgver=90.bfd285c
pkgrel=1
pkgdesc="Gnome-Shell Extension for intel-pstate driver"
arch=('any')
url="https://github.com/martin31821/cpupower"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/martin31821/cpupower.git' 'localedir.patch')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd $_gitname
	patch -p1 -i "${srcdir}/localedir.patch"
}

package() {
  cd $_gitname
  _extid="cpupower@mko-sl.de"
  _extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

  install -dm755 "${_extpath}"
  cp -r * "${_extpath}"
}
md5sums=('SKIP'
         '22c90247ab471fe86f837b5f0bc27416')

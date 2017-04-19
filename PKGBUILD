# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-maximus-ng-git
_gitname=maximus-gnome-shell
pkgver=120.f65f22e
pkgrel=1
pkgdesc="Undecorate maximized windows, like Ubuntu's old 'Maximus' package."
arch=('any')
url="https://github.com/luispabon/maximus-gnome-shell"
license=('GPL3')
depends=('gnome-shell' 'glib2')
makedepends=('git' 'python2')
source=('git+https://github.com/luispabon/maximus-gnome-shell.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $_gitname
  sed -i -re '0,/^UUID=(.*)$/s/python/python2/g' Makefile
}

package() {
  cd $_gitname
  _extpath="${pkgdir}/usr/share/gnome-shell/extensions"
  make
  install -dm755 "${_extpath}"
  cp -r build/* "${_extpath}"
}

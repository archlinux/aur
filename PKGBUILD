# Maintainer: Kishore G <kishore96 at gmail dot com>
pkgname=plasma6-runners-appmenu-git
pkgver=r16.f705ea0
pkgrel=1
pkgdesc="A little krunner plugin (Plasma 6) to search through the menu items of the current application."
arch=('any')
url="https://github.com/Kishore96in/krunner-appmenu"
license=('GPL')
groups=()
depends=('krunner' 'python' 'python-xlib' 'python-dbus' 'python-gobject')
makedepends=('git')
conflicts=('plasma5-runners-appmenu-git')
install="plasma6-runners-appmenu-git.install"
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd krunner-appmenu
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd krunner-appmenu
  
  mkdir -p "$pkgdir"/usr/share/krunner/dbusplugins
  cp plasma-runner-krunner_appmenu.desktop "$pkgdir"/usr/share/krunner/dbusplugins
  
  mkdir -p "$pkgdir"/usr/bin
  cp krunner_appmenu.py "$pkgdir"/usr/bin/
  
  mkdir -p "$pkgdir"/etc/xdg/autostart
  sed "s|@PROJECTDIR@|/usr/bin|" krunner_appmenu_autostart.desktop.in > "$pkgdir"/etc/xdg/autostart/krunner_appmenu_autostart.desktop
}

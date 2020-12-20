# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-noannoyance_v2-git
pkgver=r34.f6e7691
pkgrel=1
pkgdesc="Removes the 'Window is ready' notification and puts the window into focus"
arch=(any)
url="https://github.com/BjoernDaase/noannoyance"
license=('GPL2')
depends=('gnome-shell>=3.30')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+https://github.com/BjoernDaase/noannoyance.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _uuid="noannoyance@daase.net"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  
  cd "$srcdir/${pkgname%-git}"

#  find . \( -name "*.js" -o -name "*.json" \) -exec install -Dm 644 {} ${_destdir}/{} \;
  find . -regextype posix-egrep -regex ".*\.(js|json|md)$" -exec install -Dm 644 {} ${_destdir}/{} \;
  chmod -R 755 "${_destdir}/"
}


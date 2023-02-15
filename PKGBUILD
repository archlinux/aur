pkgname=gnome-shell-extension-notification-timeout-git
pkgver=r16.3e653e9
pkgrel=1
pkgdesc="Gnome Shell extension for configuring notification timeout."
arch=("any")
url="https://github.com/vchlum/notification-timeout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
provides=("gnome-shell-extension-notification-timeout")
conflicts=("gnome-shell-extension-notification-timeout")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec install -Dm644 {} ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/{} \;

  cd "$srcdir/$pkgname/schemas"
  find . -regextype posix-egrep -regex ".*\.gschema\.xml$" -exec install -Dm644 {} ${pkgdir}/usr/share/glib-2.0/schemas/{} \;
}

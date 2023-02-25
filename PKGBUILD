# Maintainer: ArcanusNEO <admin@transcliff.top>
pkgname=gnome-shell-extension-ibus-switcher-git
pkgver=r5.20e8280
pkgrel=1
pkgdesc="A gnome shell extension to use d-bus to switch ibus source."
arch=("any")
url="https://github.com/kevinhwang91/gnome-shell-ibus-switcher"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
provides=("gnome-shell-extension-ibus-switcher")
conflicts=("gnome-shell-extension-ibus-switcher")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  sed -i 's/"version": [[:digit:]][[:digit:]]*/"version": '"$(git rev-list --count HEAD)"'/' metadata.json;
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec install -Dm644 {} ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/{} \;

  #cd "$srcdir/$pkgname/schemas"
  #find . -regextype posix-egrep -regex ".*\.gschema\.xml$" -exec install -Dm644 {} ${pkgdir}/usr/share/glib-2.0/schemas/{} \;
}

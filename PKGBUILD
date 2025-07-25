# Maintainer:
# Contributor: timescam <timescam at duck dot com>

_pkgname="dracula-cursors"
pkgname="$_pkgname-git"
pkgver=4.0.0.r125.g9694897
pkgrel=1
pkgdesc="Dracula theme cursors"
url="https://github.com/dracula/gtk"
license=("GPL-3.0-or-later")
arch=("any")

makedepends=("git")

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"

  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$_pkgsrc/kde/cursors/Dracula-cursors" "$pkgdir/usr/share/icons/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

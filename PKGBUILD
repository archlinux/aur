# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Francois Menning <f.menning@pm.me>
pkgname=volantes-cursors-git
pkgver=r7.b13a4bb
pkgrel=1
pkgdesc="Classic cursor with a flying style."
arch=('any')
url="https://github.com/varlesh/volantes-cursors"
license=('GPL-2.0-or-later')
makedepends=('git' 'inkscape' 'libcanberra' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("git+https://github.com/varlesh/volantes-cursors.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export NO_AT_BRIDGE=1
  export DBUS_SESSION_BUS_ADDRESS=disabled
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

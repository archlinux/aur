# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=nautilus-code-git
pkgver=0.4+0+g905db8f
pkgrel=1
pkgdesc="Adds right-click menu items to open current folder in code editors"
arch=(any)
url="https://github.com/realmazharhussain/nautilus-code"
license=('AGPL3')
depends=('libnautilus-extension')
makedepends=('git' 'meson')
optdepends=("code: for 'Open in VSCode' menu item"
            "gnome-builder: for 'Open in Builder' menu item")
provides=('nautilus-code')
conflicts=('nautilus-code')
backup=()
source=("$pkgname"::"git+$url")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed -e 's/^v//' -e 's/-/+/g'
}
build() {
   arch-meson "$srcdir/$pkgname" build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}

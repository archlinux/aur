# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=nautilus-code-git
pkgver=0.5+11+gba288ea
pkgrel=1
pkgdesc="Adds right-click menu items to open current folder in code editors"
arch=(any)
url="https://github.com/realmazharhussain/nautilus-code"
license=('AGPL3')
depends=('python-nautilus')
makedepends=('git' 'meson')
provides=('nautilus-code')
conflicts=('nautilus-code')
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

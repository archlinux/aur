# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=nautilus-code
__pkgver='0.4'
pkgver=${__pkgver/-/+}
pkgrel=2
pkgdesc="Adds right-click menu items to open current folder in code editors"
arch=(any)
url="https://github.com/realmazharhussain/nautilus-code"
license=('AGPL3')
depends=('libnautilus-extension')
makedepends=('git' 'meson')
optdepends=("code: for 'Open in VSCode' menu item"
            "gnome-builder: for 'Open in Builder' menu item")
backup=()
source=("${pkgname}-${__pkgver}.tar.gz"::"$url/archive/refs/tags/v${__pkgver}.tar.gz")
md5sums=('e676bf7ea18e3f281848df78398f7add')

prepare() {
  cd "$srcdir/$pkgname-${__pkgver}"
}
build() {
   arch-meson --buildtype=release "${srcdir}/${pkgname}-${__pkgver}" build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}

# Maintainer: paperbenni <paperbenni@gmail.com>
if [ -e /tmp/instanttheme ]; then
  echo "theme override found"
  THEME=$(cat /tmp/instanttheme)
else
  THEME=arc
fi

_pkgname=instantmenu
pkgname=$_pkgname
pkgver=202007232016
pkgrel=1
pkgdesc="menu for instantOS"
url="https://github.com/instantos/instantmenu"
arch=('any')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=(instantmenu)
conflicts=(instantmenu)
source=("$_pkgname::git+https://github.com/instantOS/instantMENU.git")

sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

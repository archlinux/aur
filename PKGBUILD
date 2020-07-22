# Maintainer: paperbenni <paperbenni@gmail.com>
if [ -e /tmp/instanttheme ]; then
  echo "theme override found"
  THEME=$(cat /tmp/instanttheme)
else
  THEME=manjaro
fi

pkgname=instantwm

_pkgname=instantwm-git
pkgver=202005271719
pkgrel=1
pkgdesc="window manager for instantOS"
url="https://github.com/instantos/instantwm"
arch=('any')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
provides=('instantwm')
conflicts=('instantwm')

source=("$_pkgname::git+https://github.com/instantOS/instantWM.git")
md5sums=("SKIP")

pkgver() {
  cd $_pkgname
  echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

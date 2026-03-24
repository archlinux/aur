# Maintainer: mi4code

pkgname=li-panel-git
pkgver=r6.1f103ed
pkgrel=1
pkgdesc='Customizable HTML panel/desktop widget.'
url='https://github.com/mi4code/li-panel'
arch=(x86_64 aarch64 armv7h i686)
license=('MIT')
depends=('libhui')
makedepends=('wayland' 'wlr-protocols')
provides=('li-panel')
conflicts=('li-panel')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/li-panel"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/li-panel"
  mkdir -p build
  cd build
  make -f ../Makefile
}

package() {
  install -Dm755 "$srcdir/li-panel/li-panel/build/li_panel" "$pkgdir/usr/bin/li_panel"
  install -Dm644 "$srcdir/li-panel/LICENSE" "$pkgdir/usr/share/licenses/li-panel/LICENSE"
}

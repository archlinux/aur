# Maintainer: 2ion <dev@2ion.de>
pkgname=dmenuv-git
pkgver=4.5.r16
pkgrel=2
pkgdesc="suckless dmenu with gravity patchset"
arch=('i686' 'x86_64')
url="https://github.com/2ion/dmenu-v"
license=('MIT')
depends=('libxinerama' 'bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dmenuv::git+https://github.com/2ion/dmenu-v.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "4.5.r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 dmenu "${pkgdir}/usr/bin/${pkgname%-git}"
}

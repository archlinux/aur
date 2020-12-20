# Maintainer: Klaus-Dieter Schmatz <tucuxir at sapo dot pt>
pkgname=dwm-tucuxi-git
pkgver=6.2.r32.gfabd03a
pkgrel=1
pkgdesc="A customized DWM build"
arch=('x86_64')
url="https://gitlab.com/tuxaua/dwm"
license=('MIT')
groups=()
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
optdepends=('alacritty: terminal support'
            'dmenu: program launcher support'
            'rofi: application launcher support')
provides=('dwm')
conflicts=('dwm')
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/tuxaua/dwm.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${pkgname%-git}"
  echo "pkgdir:" $pkgdir
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

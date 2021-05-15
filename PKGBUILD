# Maintainer: Klaus-Dieter Schmatz <tucuxir at sapo dot pt>
pkgname=st-tucuxi-git
pkgver=0.8.2.r76.g8956136
pkgrel=1
pkgdesc="A customized ST build"
arch=("x86_64")
url="https://gitlab.com/tuxaua/st"
license=("MIT")
groups=()
depends=("libx11" "libxft")
makedepends=("ncurses" "libxext" "git")
optdepends=()
provides=("st")
conflicts=("st")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/tuxaua/st.git")
md5sums=("SKIP")

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
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

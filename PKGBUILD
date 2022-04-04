# Maintainer: purpleleaf  <max@ganoia.eu>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=jgmenu
_pkgver=4.4.0
pkgname=${_pkgname}-git
pkgver=${_pkgname}+9f212d
pkgrel=6
pkgdesc="Simple, independent, contemporary-looking X11 menu, designed for scripting, ricing and tweaking. Compiled with gtktheme, lx and pmenu support"
arch=('x86_64')
url="https://jgmenu.github.io/"
license=('GPL2')
depends=('libx11' 'cairo' 'pango' 'libxrandr' 'librsvg' 'libxml2' 'glib2' 'menu-cache' 'python')
makedepends=(git)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/johanmalm/jgmenu.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+%s" "${_pkgver}" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure \
    --with-gtktheme \
    --with-lx \
    --with-pmenu \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}

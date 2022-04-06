# Maintainer: purpleleaf  <max@ganoia.eu>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=jgmenu
pkgname=${_pkgname}-git
pkgver=4.4.0.r1.gc258a6c
pkgrel=1
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
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=linthesia-git
_pkgname=linthesia
epoch=1
pkgver=r177.d262d90
pkgrel=3
pkgdesc="A game of playing music. A fork of Synthesia (git)"
arch=('i686' 'x86_64')
url="https://github.com/linthesia/linthesia"
license=('GPL2')
depends=('gconfmm' 'gtkglextmm' 'alsa-lib' 'fluidsynth' 'sdl2_image' 'sdl2_ttf' 'sqlite' 'dconf')
makedepends=('git' 'cmake')
conflicts=('linthesia')
source=("linthesia::git+https://github.com/linthesia/linthesia.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  meson --prefix /usr build
  ninja -C build
}

package () {
  cd "$srcdir/${_pkgname}"
  DESTDIR="$pkgdir" ninja -C build install
  # Install docs
  install -Dm644 README.md $pkgdir/usr/share/doc/linthesia/README.md
  install -Dm644 COPYING $pkgdir/usr/share/doc/linthesia/COPYING
  install -Dm644 CHANGELOG $pkgdir/usr/share/doc/linthesia/CHANGELOG
}

# Maintainer: nardholio <nardholio@gmail.com>

pkgname=ruby-sdl2
pkgver=0.3.6.r3.g6ebccec
pkgrel=1
pkgdesc="Ruby wrapper for SDL 2.x"
arch=('any')
url="https://github.com/ohai/ruby-sdl2"
license=('MIT')
depends=('ruby' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git' 'ruby-rake')
source=("git+${url}.git#commit=6ebccec7072bb8286d8020c49d2e099142402c6c")
sha256sums=('5e777b847ead7765fb2096bea2b5c9c5fea480f955403dd34474139fb67734c5')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  for f in *.c.m4; do m4 "$f" > "${f%.m4}"; done
  ruby extconf.rb
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 README.md   -t "${pkgdir}/usr/share/doc/${pkgname}"
}

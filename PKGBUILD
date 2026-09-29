# Maintainer: nardholio <nardholio@gmail.com>

pkgname=ruby-sdl2
pkgver=0.3.6.r16.g3ef0a71
pkgrel=1
pkgdesc="Ruby wrapper for SDL 2.x"
arch=('any')
url="https://github.com/ohai/ruby-sdl2"
license=('LGPL')
depends=('ruby' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git' 'ruby-rake')
source=("git+${url}.git#commit=3ef0a714eb75b43a86674b25b8739d1e5626b669")
sha256sums=('2cf9cce287fdaa237265fe8afdce9684fbd677286cac33683f9a3bd346e53137')

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

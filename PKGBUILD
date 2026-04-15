# Maintainer: nardholio <nardholio@gmail.com>

pkgname=ruby-sdl2
pkgver=0.3.6.r3.g6ebccec
pkgrel=1
pkgdesc="Ruby wrapper for SDL 2.x"
arch=('any')
url="https://github.com/ohai/ruby-sdl2"
license=('LGPL')
depends=('ruby' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git' 'ruby-rake')
source=("git+${url}.git#commit=e92eee29a50ed972f30a1788f71b9368186152cc")
sha256sums=('1989786780f3f426b2b9a0f4cc028c5a884fd50052a6dd3df4031fa79cdfcaed')

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

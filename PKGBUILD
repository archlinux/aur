# Maintainer: Jokler <jokler.contact@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
pkgname='jp2a-git'
_gitname='jp2a'
pkgver=v1.3.1.r0.g95bcfa0
pkgrel=1
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Talinx/jp2a'
provides=('jp2a')
conflicts=('jp2a')
license=('GPL')
depends=(
  'curl'
  'glibc'
  'libexif'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'ncurses'
)
makedepends=('git')
source=('git+https://github.com/Talinx/jp2a#branch=develop')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/jp2a"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"
  autoreconf -vi
}

build() {
  cd "${_gitname}"
  bashcompdir=/usr/share/bash-completion/completions ./configure --prefix='/usr'
  make
}

check() {
  cd "${_gitname}"
  make check
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}

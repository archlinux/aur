# Maintainer: John Johnstone <jjohnstone@riseup.net>

pkgname=rofi-blezz
_gitname=rofi-blezz
pkgver=r23.9416add
pkgrel=1
pkgdesc="A plugin for rofi that emulates blezz behaviour."
arch=('i686' 'x86_64')
url="https://github.com/davatorium/rofi-blezz"
license=('MIT')
depends=(rofi)
options=('!libtool')
makedepends=('git')
provides=('rofi-blezz')
source=("git+https://github.com/davatorium/rofi-blezz.git")
md5sums=('SKIP')
pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  autoreconf --install

  # Default compiler = clang, which can be a problem if using hardening-wrapper
  CC=gcc ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make install DESTDIR="${pkgdir}"
}

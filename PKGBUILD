# Maintainer: Rasmus Steinke <rasi@xssn.at>

pkgname=rofi-top-git
_gitname=rofi-top
pkgver=r23.9416add
pkgrel=1
pkgdesc="A plugin for rofi that emulates top behaviour."
arch=('i686' 'x86_64')
url="https://gitcrate.org/qtools/rofi-top"
license=('MIT')
depends=(rofi libgtop)
options=('!libtool')
makedepends=('git')
provides=('rofi-top')
source=("git+https://gitcrate.org/qtools/rofi-top.git")
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

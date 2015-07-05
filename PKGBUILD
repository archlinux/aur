# Maintainer: Arthur Țițeică arthur.titeica/gmail/com

pkgname=smoothscan-git
pkgver=4.0fe04ed
pkgrel=2
pkgdesc="A tool to convert scanned text into a vectorized output form."
arch=('i686' 'x86_64')
url="https://natecraun.net/projects/smoothscan/"
license=('GPL3')
depends=('leptonica' 'libharu' 'potrace' 'fontforge' 'python2')
makedepends=('git')
provides=(smoothscan)
source=('git://github.com/ncraun/smoothscan.git')
md5sums=('SKIP')

_gitname=smoothscan

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"
  autoreconf -i
}

build() {
  cd "${_gitname}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
